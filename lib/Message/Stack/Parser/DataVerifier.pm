package Message::Stack::Parser::DataVerifier;
use Moose;

with 'Message::Stack::Parser';

use Message::Stack::Message;

=head1 NAME

Message::Stack::Parser::DataVerifier - Add messages to a Message::Stack from a Data::Verifier results

=head1 SYNOPSIS

  use Message::Stack::Parser::DataVerifier;

  # Pass a Data::Verifier::Results object to parse.
  my $ms = Message::Stack::Parser::DataVerifier->new->parse(
    Message::Stack->new,
    $scope,
    $dv_results
  );

=head1 DESCRIPTION

This class will add a message to the provided L<Message::Stack> for every
missing or invalid field in a L<Data::Verifier::Result>.

The fields are mapped from Data::Verifier into a Message in the following way:

=head2 Missing Fields

=over 4

=item B<id> = C<"missing_$fieldname">

=item B<scope> = The passed in scope

=item B<subject> = C<$fieldname>

=item B<level> = 'error'

=back

=head2 Invalid Fields

=over 4

=item B<id> = C<"invalid_$fieldname">

=item B<scope> = The passed in scope

=item B<subject> = C<$fieldname>

=item B<level> = 'error'

=item B<params> = The original value (that provided by the user) for the field.

=back

=head1 METHODS

=head2 parse ($stack, $scope, $results)

Adds messages from the provided C<$results> to the provided C<$stack> under
the C<$scope> that is passed in.

=cut

sub parse {
    my ($self, $stack, $scope, $results) = @_;

    foreach my $f ($results->missings) {
        $stack->add(Message::Stack::Message->new(
            id      => "missing_$f",
            scope   => $scope,
            subject => $f,
            level   => 'error'
        ));
    }

    foreach my $f ($results->invalids) {
        $stack->add(Message::Stack::Message->new(
            id      => "invalid_$f",
            scope   => $scope,
            subject => $f,
            level   => 'error',
            params  => [ $results->get_original_value($f) ]
        ));
    }
}

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
