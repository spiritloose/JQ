# NAME

JQ - Perl binding for jq

# SYNOPSIS

    use JQ;

    my @res = jq '.[]', $json;

    # OO Interface
    my @res = JQ->new('.[]')->execute($json);

# DESCRIPTION

JQ is a Perl binding for jq.

# LICENSE

Copyright (C) Jiro Nishiguchi.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO

[https://stedolan.github.io/jq/](https://stedolan.github.io/jq/), [JSON::Path](https://metacpan.org/pod/JSON::Path)

# AUTHOR

Jiro Nishiguchi &lt;jiro@cpan.org>
