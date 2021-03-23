update: pull
	$(MAKE) vim_plugupdate
	$(MAKE) status_blocks

vim_plug:
	curl -fLo ~/.vim/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim

vim_plugupdate: vim_pluginstall
	nvim --headless +'PlugUpdate' +qall

vim_pluginstall: vim_plug
	nvim --headless +'PlugInstall' +qall

pull:
	git --git-dir=$(HOME)/.dotfiles/ --work-tree=$(HOME) pull --no-edit
	git --git-dir=$(HOME)/.dotfiles/ --work-tree=$(HOME) submodule init
	git --git-dir=$(HOME)/.dotfiles/ --work-tree=$(HOME) submodule update

status_blocks:
	make -C .status_blocks
