# vars i'm probably going to need
# NODEENV_HOME
# \-> TODO: derive npm local install dir from this
# NODEENV_ENV
# ^current virtualenv

#TODO: put in separate script
#export
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

# remove nodeenv
rmnodeenv(){
	node_env=$1
	echo "removing node environment: $node_env"
	#TODO: replace ./ with path var
	"rm" -r "~/.nodeenv/$node_env"
}

# activate nodeenv
# takes param $env_name
# activate=$NDOEENV_HOME/$env_name/bin/activate
# will need to deactivate any current env?
workon_nodeenv(){
	node_env=$1
	echo $node_env
	type deactivate_node >/dev/null 2>&1	
	
	if [ $? -eq 0 ]; then
		deactivate_node
	fi
	
	source "$NODEENV_HOME$node_env/bin/activate"
}

# deactivate nodeenv
deactivate_nodeenv(){
	deactivate_node
}

# change dir to node environment root
cdnodeenv(){
	node_env=$1
	#TODO: change ./ to path var
	'cd' "~/.nodeenv/$node_env"
}

# list node envs
lsnodeenv(){
	'ls' '~/.nodeenv'
}

# NOTE: Below may be intended behavior (going into local proj dir), but I wonder if it still works if we install a 'local' version into the central nodeenv?

# EXPRIMENTAL: 

# install npm module, but with centralized directory since npm seems to dump 'node_modules where ever you run it (local install only)
# TODO: see how npm acts with global installs
#npm_install(){}
