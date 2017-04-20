.PHONY: link
link:
	ln -sir _dircolors -T ~/.dircolors
	ln -sir _inputrc -T ~/.inputrc
	test -d ~/.local/bin || mkdir -p ~/.local/bin
	ln -sir _local/bin/* -t ~/.local/bin
	ln -sir _tmux.conf -T ~/.tmux.conf
	ln -sir _zdir -T ~/.zdir
	ln -sir _zprofile -T ~/.zprofile
	ln -sir _zshrc -T ~/.zshrc
