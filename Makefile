.PHONY: link
link:
	ln -sir _dircolors -T ~/.dircolors
	ln -sir _inputrc -T ~/.inputrc
	test -d ~/.local/bin || mkdir -p ~/.local/bin
	ln -sir _local/bin/* -t ~/.local/bin
	ln -sir _tmux.conf -T ~/.tmux.conf
	test -d ~/.zdir || mkdir ~/.zdir
	ln -sir _zdir/* -t ~/.zdir
	ln -sir _zprofile -T ~/.zprofile
	ln -sir _zalias -T ~/.zalias
	ln -sir _zshenv -T ~/.zshenv
	ln -sir _zshrc -T ~/.zshrc

.PHONY: install install-dependencies
install: install-dependencies

install-dependencies:
	sudo pacman -Sy fd-rs fasd ripgrep zsh zsh-completions
