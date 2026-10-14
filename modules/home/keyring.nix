{ lib, ... }:
{
  home.activation.defaultKeyring = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    run mkdir -p "$HOME/.local/share/keyrings"
    run chmod 700 "$HOME/.local/share/keyrings"
    if [ "$(cat "$HOME/.local/share/keyrings/default" 2>/dev/null)" != "login" ]; then
      run sh -c 'printf login > "$HOME/.local/share/keyrings/default"'
    fi
  '';
}
