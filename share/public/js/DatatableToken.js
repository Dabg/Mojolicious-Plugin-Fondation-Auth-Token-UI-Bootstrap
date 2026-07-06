$(function() {
    if (!$('#token-panel').length) return;

    // Load token list
    function loadTokens() {
        $.get('/api/ApiToken', function(data) {
            var rows = '';
            var tokens = Array.isArray(data) ? data : [];
            if (tokens.length === 0) {
                rows = '<tr><td colspan="4" class="text-muted">'
                     + l('No tokens yet') + '</td></tr>';
            }
            tokens.forEach(function(t) {
                var created = t.created_at ? t.created_at.substring(0, 10) : '-';
                var lastUsed = t.last_used_at ? t.last_used_at.substring(0, 10) : '-';
                rows += '<tr>'
                    + '<td>' + escapeHtml(t.name) + '</td>'
                    + '<td>' + created + '</td>'
                    + '<td>' + lastUsed + '</td>'
                    + '<td><button class="btn btn-sm btn-danger revoke-btn" '
                    + 'data-id="' + t.id + '" data-name="' + escapeHtml(t.name) + '">'
                    + l('Revoke') + '</button></td>'
                    + '</tr>';
            });
            $('#token-table tbody').html(rows);
        });
    }

    loadTokens();

    // Generate new token
    $('#generate-form').on('submit', function(e) {
        e.preventDefault();
        var name = $('#token-name').val().trim();
        if (!name) return;

        $.ajax({
            url: '/api/token/generate',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ name: name }),
            success: function(data) {
                $('#raw-token').val(data.raw_token);
                $('#result-name').text(data.name);
                $('#token-result').show();
                $('#token-name').val('');
                loadTokens();
            },
            error: function(xhr) {
                var msg = xhr.responseJSON?.errors?.[0]?.message
                       || xhr.statusText || 'Error';
                alert(msg);
            }
        });
    });

    // Copy token to clipboard
    $('#copy-btn').on('click', function() {
        var input = $('#raw-token')[0];
        input.select();
        input.setSelectionRange(0, 99999);

        var text = input.value;
        if (navigator.clipboard && navigator.clipboard.writeText) {
            navigator.clipboard.writeText(text).then(function() {
                showCopied();
            });
        } else {
            // Fallback for HTTP (non-secure context)
            try {
                var ok = document.execCommand('copy');
                if (ok) showCopied();
            } catch(e) {
                // Nothing — user can still Ctrl+C
            }
        }
    });

    // Revoke token
    $('#token-table').on('click', '.revoke-btn', function() {
        var id   = $(this).data('id');
        var name = $(this).data('name');
        if (!confirm(l('Revoke token') + ' "' + name + '"?')) return;

        $.ajax({
            url: '/api/ApiToken/' + id,
            method: 'DELETE',
            success: function() { loadTokens(); },
            error: function(xhr) {
                var msg = xhr.responseJSON?.errors?.[0]?.message
                       || xhr.statusText || 'Error';
                alert(msg);
            }
        });
    });

    function escapeHtml(str) {
        var div = document.createElement('div');
        div.appendChild(document.createTextNode(str));
        return div.innerHTML;
    }

    function showCopied() {
        $('#copy-btn').text(l('Copied!'));
        setTimeout(function() { $('#copy-btn').text(l('Copy')); }, 2000);
    }
});
