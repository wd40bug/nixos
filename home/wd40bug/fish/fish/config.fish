set -gx COLUMNS $COLUMNS

if test -e /run/.containerenv
    # Actions to perform only INSIDE the Distrobox container
    set -g IS_DISTROBOX true
    
    # Optional: Get the name of the current container
    # Distrobox populates the $CONTAINER_ID or $HOSTNAME variable
    echo "Welcome to your Distrobox container: $CONTAINER_ID"

    fish_add_path -g "/home/wd40bug/ubuntu-box/binaries/"
end

if status is-interactive
    starship init fish | source
    zoxide init fish --cmd cd | source
end
