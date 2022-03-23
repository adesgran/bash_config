alias baliases="vim ~/.bash_aliases"
alias brc="vim ~/.bashrc"

alias vrc="vim ~/.vimrc"

alias gpush="git push origin main"

add-repo ()
{
	git clone https://github.com/adesgran/$1 temp ;
	mv temp/* . ;
	rm -rf temp ;
}

gcom ()
{
	git commit -m "$1"
}

github ()
{
	if [ -f $1 ] ; then echo "'$1' already exist here";
	else git clone git@github.com:adesgran/$1.git; fi
}

gitall ()
{
	echo Comment for your commit : ;
	read github_commit_msg ;
	git commit -m "$github_commit_msg" ;
	git push origin main ;
}

workspace ()
{
	cd ~/goinfre;
	github $1;
	cd $1;
}

updatevim ()
{
	workspace vimrc;
	cp .vimrc ~/.vimrc;
	cd ..;
	rm -rf vimrc;
	workspace vim_plugins;
	cp *.vim ~/.vim/plugin;
	cd ..;
	rm -rf vim_plugins;
	cd;
	clear;
}

uploadvim ()
{
	workspace vimrc;
	cp ~/.vimrc .vimrc;
	git add .vimrc;
	git commit -m "Update Vimrc";
	git push origin main;
	cd ..;
	rm -rf vimrc;
	workspace vim_plugins;
	cp ~/.vim/plugin/*.vim .;
	git add *.vim;
	git commit -m "Update Vim Plugins";
	git push origin main;
	cd ..;
	rm -rf vim_plugins;
	cd;
	clear;
}

updatebash ()
{
	workspace bash_config;
	cp .bash_aliases ~/.bash_aliases;
	cp -rf .bash_d ~/.bash_d;
	cd ..;
	rm -rf bash_config;
	cd;
	clear;
}

uploadbash ()
{
	workspace bash_config;
	cp ~/.bash_aliases .bash_aliases;
	cp -rf ~/.bash_d .bash_d;
	git add .bash_aliases;
	git add .bash_d/.bash*;
	git commit -m "Update Bash";
	git push origin main;
	cd ..;
	rm -rf bash_config;
	cd;
	clear;
}
