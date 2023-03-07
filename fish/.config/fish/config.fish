if status is-interactive
    alias l "ls -AFG"
    alias mach "$HOME/dev/moz/mach"
end

fish_add_path ~/.local/bin/
fish_add_path ~/.cargo/bin/

# opam configuration
source /home/adam/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
