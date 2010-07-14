use inc::Module::Install;

name     'Message-Stack-Parser';
all_from 'lib/Message/Stack/Parser.pm';
author   q{Cory G Watson <gphat@cpan.org>};
license  'perl';

build_requires 'Test::More';

requires 'Message::Stack';
recommends 'Data::Verifier';

WriteAll;

