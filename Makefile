update: pull
	$(MAKE) vim_plugupdate
	$(MAKE) status_blocks
	$(MAKE) tmux_tpm_update

vim_plug:
	curl -fLo ~/.vim/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim

vim_plugupdate: vim_pluginstall
	nvim --headless +'PlugUpdate' +qall

vim_pluginstall: vim_plug
	nvim --headless +'PlugInstall' +qall

tmux_tpm_update:
	$(HOME)/.tmux/plugins/tpm/bin/clean_plugins
	$(HOME)/.tmux/plugins/tpm/bin/install_plugins
	$(HOME)/.tmux/plugins/tpm/bin/update_plugins all

pull:
	git --git-dir=$(HOME)/.dotfiles/ --work-tree=$(HOME) pull --no-edit
	git --git-dir=$(HOME)/.dotfiles/ --work-tree=$(HOME) submodule init
	git --git-dir=$(HOME)/.dotfiles/ --work-tree=$(HOME) submodule update --remote

status_blocks:
	make -C .status_blocks
