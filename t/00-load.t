#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Message::Stack::Parser' );
}

diag( "Testing Message::Stack::Parser $Message::Stack::Parser::VERSION, Perl $], $^X" );
