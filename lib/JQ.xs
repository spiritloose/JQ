#ifdef __cplusplus
extern "C" {
#endif
#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif

/* Hack to work around "error: declaration of 'Perl___notused' has a different */
/* language linkage" error on Clang */
#ifdef dNOOP
# undef dNOOP
# define dNOOP
#endif

#define NEED_sv_2pv_flags
#define NEED_newRV_noinc
#define NEED_newSVpvn_flags
#include "ppport.h"

#include <float.h>
#include <jq.h>

static void
jq_xs_err_cb(void* data, jv e) {
    SV* sv = (SV *) data;
    e = jq_format_error(e);
    sv_catpvf(sv, "%s\n", jv_string_value(e));
    jv_free(e);
}

static SV*
jq_xs_jv2sv(pTHX_ jv v) {
    switch (jv_get_kind(v)) {
        case JV_KIND_NULL:
            return newSV(0);
        case JV_KIND_FALSE:
            return SvREFCNT_inc_simple_NN(get_sv("Types::Serialiser::false", 0));
        case JV_KIND_TRUE:
            return SvREFCNT_inc_simple_NN(get_sv("Types::Serialiser::true", 0));
        case JV_KIND_NUMBER: {
            double d = jv_number_value(v);
            if (d != d) {
                return newSV(0);
            }
            if (d > DBL_MAX) d = DBL_MAX;
            if (d < -DBL_MAX) d = -DBL_MAX;
            return newSVnv(d);
        }
        case JV_KIND_STRING: {
            int len = jv_string_length_bytes(jv_copy(v));
            return newSVpvn_utf8(jv_string_value(v), len, 1);
        }
        case JV_KIND_ARRAY: {
            AV* result = newAV();
            jv_array_foreach(v, i, e) {
                av_push(result, jq_xs_jv2sv(aTHX_ e));
            }
            return newRV_noinc((SV *) result);
        }
        case JV_KIND_OBJECT: {
            HV* result = newHV();
            jv_object_foreach(v, key, value) {
                const char* key_str = jv_string_value(key);
                int key_len = jv_string_length_bytes(jv_copy(key));
                hv_store(result, key_str, key_len, jq_xs_jv2sv(aTHX_ value), 0);
            }
            return newRV_noinc((SV *) result);
        }
        default:
            croak("Invalid value");
    }
}

MODULE = JQ PACKAGE = JQ

PROTOTYPES: DISABLE

BOOT:
    require_pv("Types/Serialiser.pm");

jq_state*
new(const char* klass, const char* program)
CODE:
    jq_state* jq = jq_init();
    if (!jq) {
        croak("Could not initialize jq");
    }
    SV* err = sv_2mortal(newSVpv("", 0));
    jq_set_error_cb(jq, jq_xs_err_cb, err);
    if (!jq_compile(jq, program)) {
        jq_set_error_cb(jq, NULL, NULL);
        jq_teardown(&jq);
        croak_sv(err);
    }
    jq_set_error_cb(jq, NULL, NULL);
    RETVAL = jq;
OUTPUT:
    RETVAL

void
execute(jq_state* jq, SV* json)
PREINIT:
    STRLEN len;
    jv result;
    int i = 0;
PPCODE:
    const char* str = SvPV(json, len);
    jv v = jv_parse_sized(str, len);
    if (!jv_is_valid(v)) {
        const char* err;
        v = jv_invalid_get_msg(v);
        err = SvPV_nolen(sv_2mortal(newSVpv(jv_string_value(v), 0)));
        jv_free(v);
        croak("%s", err);
    }
    jq_start(jq, v, 0);
    while (jv_is_valid(result = jq_next(jq))) {
        mXPUSHs(jq_xs_jv2sv(aTHX_ result));
        i++;
    }
    XSRETURN(i);

void
DESTROY(jq_state* jq)
CODE:
    jq_teardown(&jq);
