use strict;
use warnings;
use Test::More;

use JQ;
use Types::Serialiser;
use Encode;

isa_ok(JQ->new('.'), 'JQ');

subtest null => sub {
    my $ret = jq 'null', 'null';
    is $ret, undef;
};

subtest boolean => sub {
    my $ret = jq 'true', 'null';
    is $ret, Types::Serialiser::true;
    ok $ret;

    $ret = jq 'false', 'null';
    is $ret, Types::Serialiser::false;
    ok !$ret;
};

subtest number => sub {
    is jq('.', '42'), 42;
    is jq('.', '3.14'), 3.14;
};

subtest string => sub {
    is jq('.', '"Hello"'), 'Hello';
    is jq('.', '"こんにちは"'), decode_utf8('こんにちは');
};

subtest array => sub {
    is_deeply jq('.', '[1,2,3]'), [1,2,3];
    is_deeply jq('.', '[[1,2,3]]'), [[1,2,3]];
};

subtest object => sub {
    is_deeply jq('.', '{"a":"b"}'), { a => 'b' };
    is_deeply jq('.', '{"a":{"b":"c"}}'), { a => { b => 'c' }};
};

subtest invalid_json => sub {
    eval { jq '.', 'x' };
    like $@, qr/Invalid numeric literal/;
};

subtest compile_error => sub {
    eval { jq 'x', '' };
    like $@, qr/jq: error:/;
};

subtest multiple_results => sub {
    is_deeply [jq '.[]', '["foo", "bar"]'], ['foo', 'bar'];
};

done_testing;
