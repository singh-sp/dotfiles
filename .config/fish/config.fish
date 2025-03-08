eval "$(/opt/homebrew/bin/brew shellenv)"

pyenv init - fish | source

# Shortcut to dotfiles
function dotfiles
    set cwd (pwd)
    cd ~/dotfiles
    lazygit
    # $EDITOR . -c "lua Snacks.lazygit({cwd = LazyVim.root.git()})"
    cd $cwd
end

# Shortcut to dotfiles
function fishconfig
    set cwd (pwd)
    cd ~/.config/fish
    $EDITOR .
    cd $cwd
end

# Yazi File Browser
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Brew functions
function brew
    # Call the original brew command
    command brew $argv

    # Check if the command is install or uninstall
    if contains -- $argv[1] install uninstall remove
        # Generate leaves list
        set -l dotfiles_dir "$HOME/dotfiles"

        # Ensure dotfiles directory exists
        mkdir -p $dotfiles_dir

        # Write only leaves to brewpackages.txt
        command brew leaves >"$dotfiles_dir/brewpackages.txt"
    end
end

function brewrestore
    # Restore Homebrew leaves from text file
    set -l dotfiles_dir "$HOME/dotfiles"

    if test -f "$dotfiles_dir/brewpackages.txt"
        # Read leaves from file and install
        xargs brew install <"$dotfiles_dir/brewpackages.txt"
        echo "Homebrew leaves restored from $dotfiles_dir/brewpackages.txt"
    else
        echo "No brewpackages.txt found in $dotfiles_dir"
    end
end


if status is-interactive
    set fish_tmux_autostart true
    set fish_tmux_autoconnect false
end
