package JQ;
use 5.008005;
use strict;
use warnings;
use Exporter 'import';

our $VERSION = "0.01";

require XSLoader;
XSLoader::load('JQ', $VERSION);

our @EXPORT = qw(jq);

sub jq($$) { __PACKAGE__->new($_[0])->execute($_[1]) }

1;
__END__

=encoding utf-8

=head1 NAME

JQ - Perl binding for jq

=head1 SYNOPSIS

    use JQ;

    my @res = jq '.[]', $json;

    # OO Interface
    my @res = JQ->new('.[]')->execute($json);

=head1 DESCRIPTION

JQ is a Perl binding for jq.

=head1 LICENSE

Copyright (C) Jiro Nishiguchi.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<https://stedolan.github.io/jq/>, L<JSON::Path>

=head1 AUTHOR

Jiro Nishiguchi E<lt>jiro@cpan.orgE<gt>

=cut
