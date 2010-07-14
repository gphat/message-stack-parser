package Message::Stack::Parser;
use Moose::Role;

our $VERSION = '0.01';

requires 'parse';

=head1 NAME

Message::Stack::Parser - A simple role for creating a Message::Stack from things

=head1 SYNOPSIS

  use Message::Stack::Parser::DataVerifier;

  # Pass a Data::Verifier::Results object to parse.
  my $ms = Message::Stack::Parser::DataVerifier->new->parse(
    Message::Stack->new,
    $scope,
    $dv_results
  );

=head1 DESCRIPTION

Message::Stack::Parser is a L<Moose> role that is used to implement a parser
for converting something into a L<Message::Stack>.  This role is nothing more
than a single required method.  The actual point of this dist is to package
some of the parsers separate from Message::Stack or the modules that may
do the conversion.  Those are L<Message::Stack::Parser::DataVerifier> and
L<Message::Stack::Parser::FormValidator>.

=head1 METHODS

=head2 parse ($stack, $scope, $results)

Adds messages from the provided C<$results> to the provided C<$stack> under
the C<$scope> that is passed in.  This is the only method you need to implement.

The C<$stack> must be provided so multiple things may be parsed into a single
stack.  The C<$scope> is used to keep multiple parsings separated.  How this
method works is completely up to the implementor, as the C<$results> argument
could be anything.

=head1 AUTHOR

Cory G Watson, C<< <gphat at cpan.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2010 Cory G Watson.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1;
