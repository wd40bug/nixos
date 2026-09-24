set -gx COLUMNS $COLUMNS

if test -e /run/.containerenv
    # Actions to perform only INSIDE the Distrobox container
    set -g IS_DISTROBOX true

    fish_add_path -g ~/UbuntuBox/bin/
end

if status is-interactive
    starship init fish | source
    zoxide init fish --cmd cd | source
end
