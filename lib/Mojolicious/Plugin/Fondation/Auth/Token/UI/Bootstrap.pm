package Mojolicious::Plugin::Fondation::Auth::Token::UI::Bootstrap;
use Mojo::Base 'Mojolicious::Plugin', -signatures;

# ABSTRACT: Bootstrap 5 UI for Personal Access Token management

sub fondation_meta {
    return {
        dependencies => ['Fondation::Auth::Token', 'Fondation::Layout::Bootstrap'],
        defaults     => { title => 'Token Management' },
    };
}

sub register ($self, $app, $conf) {
    $app->routes->get('/profile/tokens')
        ->requires('fondation.authenticated' => 1)
        ->to(cb => sub ($c) {
            $c->render(template => 'token/list');
        });

    return $self;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Mojolicious::Plugin::Fondation::Auth::Token::UI::Bootstrap - Bootstrap 5 UI for Personal Access Token management

=head1 SYNOPSIS

    # In myapp.conf:
    plugin 'Fondation' => {
        dependencies => [
            'Fondation::Auth::Token',
            'Fondation::Auth::Token::UI::Bootstrap',
        ],
    };

=head1 DESCRIPTION

L<Mojolicious::Plugin::Fondation::Auth::Token::UI::Bootstrap> provides a
Bootstrap 5 web interface for managing Personal Access Tokens. It adds a
C<GET /profile/tokens> route that renders a token management page with
generation, listing, and revocation capabilities.

The menu entry "API Tokens" is registered under the account menu via
C<share/menus.json>.

=head1 ROUTES

=head2 GET /profile/tokens

Renders the token management page (C<share/templates/token/list.html.ep>).
Requires authentication (C<fondation.authenticated>).

=head1 DEPENDENCIES

=over 4

=item L<Mojolicious::Plugin::Fondation::Auth::Token>

Provides the core token backend: C<GET /api/ApiToken>, C<POST /api/token/generate>,
and C<DELETE /api/ApiToken/:id>.

=item L<Mojolicious::Plugin::Fondation::Layout::Bootstrap>

Provides the Bootstrap 5 layout and asset pipeline.

=back

=head1 ASSETS

=over 4

=item C<share/public/js/DatatableToken.js>

Client-side JavaScript for token list loading, generation, copy-to-clipboard,
and revocation via the API endpoints.

=item C<share/assets/assetpack.def>

AssetPack definition that bundles the JavaScript.

=back

=head1 TEMPLATES

=over 4

=item C<share/templates/token/list.html.ep>

Main token management page with generate form, result display, and token table.

=back

=head1 TRANSLATIONS

Translation files are provided for English and French in
C<share/translations/>.

=head1 SEE ALSO

L<Mojolicious::Plugin::Fondation>,
L<Mojolicious::Plugin::Fondation::Auth::Token>,
L<Mojolicious::Plugin::Fondation::Layout::Bootstrap>

=cut
