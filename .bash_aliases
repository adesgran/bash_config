alias baliases="vim ~/.bash_aliases"
alias brc="vim ~/.bashrc"

alias gpush="git push origin main"

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
