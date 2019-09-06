# /etc/profile or ~/.profile is read once every login.
# If you make any changes here, you will need to manually source the
# file or log out and in again for them to take effect.

export DE="xfce"
export BROWSER="firefox"
export EDITOR="nvim"
export TERMINAL="alacritty"
export LANG="en_US.UTF-8"
export PATH="$HOME/.local/bin:$HOME/.local/sbin:$PATH"

# Go
export GOPATH="$HOME/lang/go"
export PATH="$GOPATH/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
if command -v rustc >/dev/null; then
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi
