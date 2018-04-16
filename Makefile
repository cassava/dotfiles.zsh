# Usage: $(call link, src, dest)
define link
	test -d $$(dirname $(2)) || mkdir -p $$(dirname $(2))
	cmp $(1) $(2) 2>/dev/null || ln -sir $(1) -T $(2)
endef

define unlink
	if cmp $(1) $(2) 2>/dev/null; then \
		rm $(2); \
	else \
		test -e $(2) && rm -i $(2); \
	fi
endef

define link_to
	$(call link,$(1),$(2)/$$(basename $(1)))
endef

define unlink_from
	$(call unlink,$(1),$(2)/$$(basename $(1)))
endef

.PHONY: all
all: link provision

.PHONY: link unlink
link:
	$(call link,_dircolors,~/.dircolors)
	$(call link,_inputrc,~/.inputrc)
	$(call link_to,_local/bin/remind_me_notes,~/.local/bin)
	$(call link,_tmux.conf,~/.tmux.conf)
	$(call link_to,_zdir/10-fasd.zsh,~/.zdir)
	$(call link_to,_zdir/50-zstyle-latex.zsh,~/.zdir)
	$(call link,_zprofile,~/.zprofile)
	$(call link,_zalias,~/.zalias)
	$(call link,_zshenv,~/.zshenv)
	$(call link,_zshrc,~/.zshrc)

unlink:
	$(call unlink,_dircolors,~/.dircolors)
	$(call unlink,_inputrc,~/.inputrc)
	$(call unlink_from,_local/bin/remind_me_notes,~/.local/bin)
	$(call unlink,_tmux.conf,~/.tmux.conf)
	$(call unlink_from,_zdir/10-fasd.zsh,~/.zdir)
	$(call unlink_from,_zdir/50-zstyle-latex.zsh,~/.zdir)
	$(call unlink,_zprofile,~/.zprofile)
	$(call unlink,_zalias,~/.zalias)
	$(call unlink,_zshenv,~/.zshenv)
	$(call unlink,_zshrc,~/.zshrc)

.PHONY: provision
provision:
	ansible-playbook -i "localhost," -c local -K playbook.yml
