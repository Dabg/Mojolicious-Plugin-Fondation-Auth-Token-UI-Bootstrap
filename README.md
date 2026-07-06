# NAME

Mojolicious::Plugin::Fondation::Auth::Token::UI::Bootstrap - Bootstrap 5 UI for Personal Access Token management

# VERSION

version 0.01

# SYNOPSIS

    # In myapp.conf:
    plugin 'Fondation' => {
        dependencies => [
            'Fondation::Auth::Token',
            'Fondation::Auth::Token::UI::Bootstrap',
        ],
    };

# DESCRIPTION

[Mojolicious::Plugin::Fondation::Auth::Token::UI::Bootstrap](https://metacpan.org/pod/Mojolicious%3A%3APlugin%3A%3AFondation%3A%3AAuth%3A%3AToken%3A%3AUI%3A%3ABootstrap) provides a
Bootstrap 5 web interface for managing Personal Access Tokens. It adds a
`GET /profile/tokens` route that renders a token management page with
generation, listing, and revocation capabilities.

The menu entry "API Tokens" is registered under the account menu via
`share/menus.json`.

# NAME

Mojolicious::Plugin::Fondation::Auth::Token::UI::Bootstrap - Bootstrap 5 UI for Personal Access Token management

# ROUTES

## GET /profile/tokens

Renders the token management page (`share/templates/token/list.html.ep`).
Requires authentication (`fondation.authenticated`).

# DEPENDENCIES

- [Mojolicious::Plugin::Fondation::Auth::Token](https://metacpan.org/pod/Mojolicious%3A%3APlugin%3A%3AFondation%3A%3AAuth%3A%3AToken)

    Provides the core token backend: `GET /api/ApiToken`, `POST /api/token/generate`,
    and `DELETE /api/ApiToken/:id`.

- [Mojolicious::Plugin::Fondation::Layout::Bootstrap](https://metacpan.org/pod/Mojolicious%3A%3APlugin%3A%3AFondation%3A%3ALayout%3A%3ABootstrap)

    Provides the Bootstrap 5 layout and asset pipeline.

# ASSETS

- `share/public/js/DatatableToken.js`

    Client-side JavaScript for token list loading, generation, copy-to-clipboard,
    and revocation via the API endpoints.

- `share/assets/assetpack.def`

    AssetPack definition that bundles the JavaScript.

# TEMPLATES

- `share/templates/token/list.html.ep`

    Main token management page with generate form, result display, and token table.

# TRANSLATIONS

Translation files are provided for English and French in
`share/translations/`.

# SEE ALSO

[Mojolicious::Plugin::Fondation](https://metacpan.org/pod/Mojolicious%3A%3APlugin%3A%3AFondation),
[Mojolicious::Plugin::Fondation::Auth::Token](https://metacpan.org/pod/Mojolicious%3A%3APlugin%3A%3AFondation%3A%3AAuth%3A%3AToken),
[Mojolicious::Plugin::Fondation::Layout::Bootstrap](https://metacpan.org/pod/Mojolicious%3A%3APlugin%3A%3AFondation%3A%3ALayout%3A%3ABootstrap)

# AUTHOR

Daniel Brosseau <dab@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2026 by Daniel Brosseau.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
