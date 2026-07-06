use strict;
use warnings;
use Test::More;

use_ok 'Mojolicious::Plugin::Fondation::Auth::Token::UI::Bootstrap';
ok $Mojolicious::Plugin::Fondation::Auth::Token::UI::Bootstrap::VERSION,
    'has VERSION';

done_testing;
