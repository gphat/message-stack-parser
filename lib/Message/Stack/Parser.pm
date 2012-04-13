package Message::Stack::Parser;
use Moose::Role;

# ABSTRACT: A simple role for creating a Message::Stack from things

=method parse ($stack, $scope, $results)

Adds messages from the provided C<$results> to the provided C<$stack> under
the C<$scope> that is passed in.  This is the only method you need to implement.

The C<$stack> must be provided so multiple things may be parsed into a single
stack.  The C<$scope> is used to keep multiple parsings separated.  How this
method works is completely up to the implementor, as the C<$results> argument
could be anything.

=cut

requires 'parse';

=head1 SYNOPSIS

  use Message::Stack::Parser::DataVerifier;

  my $dv = Data::Verifier->new;

  my $dv_results = $dv->verify;

  my $scope = 'login';
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

=cut

1;
