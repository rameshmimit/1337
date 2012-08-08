#TODO: put in .profile / .bash_profile / .bashrc
export NODEENV_HOME=/home/vagrant/.nodeenv/

# make nodeenv
# only supports basic optionless call to nodeenv for the moment, my shell scripting is only so-so.
mknodeenv(){
	node_env=$1
	
	type deactivate_node >/dev/null 2>&1

	if [ $? -eq 0 ]; then	
		deactivate_node
	fi

	nodeenv "$NODEENV_HOME$node_env"
}

# activate nodeenv
# takes param $env_name
# activate=$NDOEENV_HOME/$env_name/bin/activate
# will need to deactivate any current env?
workon_nodeenv(){
	node_env=$1
	
	type deactivate_node >/dev/null 2>&1	
	
	if [ $? -eq 0 ]; then
		deactivate_node
	fi
	
	source "$NODEENV_HOME$node_env/bin/activate"
}

# remove nodeenv
rmnodeenv(){
	node_env=$1
	rm -r "$NODEENV_HOME$node_env"
}

# change dir to node environment root
cdnodeenv(){
	node_env=$1
	cd "$NODEENV_HOME$node_env"
}

# list node envs
lsnodeenv(){
	node_env=$1
	ls "$NODEENV_HOME$node_env"
}
