source $HOME/.docker/init-fish.sh || true # Added by Docker Desktop

if test -d $HOME/.local/bin
  fish_add_path ~/.local/bin
end

if test -d $HOME/dotfiles
    set -gx DOTPATH $HOME/dotfiles
end

if test -d $HOME/bin
    fish_add_path $HOME/bin
end

# OS Specific settings
## Mac
if test (uname) = 'Darwin'
    set -gx OS 'Mac'

    if test -d /opt/homebrew/bin
        fish_add_path /opt/homebrew/bin
    end

    if test -f /usr/local/bin/brew
        set -l coreutils_path (/usr/local/bin/brew --prefix coreutils)/libexec/gnubin
        if test -d $coreutils_path
            fish_add_path $coreutils_path
        end
    end

    ## asdf
    if test -d $HOME/.asdf
        fish_add_path $HOME/.asdf/bin
        fish_add_path $HOME/.asdf/shims
    end

    ## golang
    if test -d $HOME/.go
        fish_add_path $HOME/.go/bin
    end

    ## ruby version manager
    if test -d $HOME/.rvm/bin
        fish_add_path $HOME/.rvm/bin
    end

    ## rust package manager
    if test -d $HOME/.cargo/bin
        fish_add_path $HOME/.cargo/bin
    end

    ## flutter
    if test -d /opt/flutter/bin
        fish_add_path /opt/flutter/bin
        if test -d $HOME/.pub-cache/bin
            fish_add_path $HOME/.pub-cache/bin
        end
    end
end

