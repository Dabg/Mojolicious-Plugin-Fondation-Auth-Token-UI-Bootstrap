# CPAN dependencies for Mojolicious-Plugin-Fondation-Auth-Token-UI-Bootstrap

requires 'perl' => '5.026';

# Runtime
requires 'Mojolicious' => '9.46';
requires 'Mojolicious::Plugin::Fondation';
requires 'Mojolicious::Plugin::Fondation::Auth::Token';
requires 'Mojolicious::Plugin::Fondation::Layout::Bootstrap';

# Testing
on test => sub {
    requires 'Test::More' => '1.00';
    requires 'Test::Mojo';
};
