#!/usr/bin/env bash

# Create a home directory for docker server
BASE_PATH=~/.devprod/teamcity
SERVER_PATH=$BASE_PATH/server
AGENT_PATH=$BASE_PATH/agent
DATADIR=$SERVER_PATH/datadir
LOGDIR=$SERVER_PATH/logs
AGENT_CONFIG_PATH=$AGENT_PATH/conf
PORT=8000 # Hard-coded port for server and for agent

mkdir -p $DATADIR
mkdir -p $LOGDIR
mkdir -p $AGENT_CONFIG_PATH
# To let the agent create directories, we need global read/write permissions
chmod 775 $AGENT_PATH
chmod 775 $AGENT_CONFIG_PATH
echo "Storing teamcity server data in $SERVER_PATH. Remove directory after testing to reduce file pollution."

docker-compose up --force-recreate --detach
echo "Finished starting a server at localhost:$PORT and three agents. (Note: max number of agents for free version is three)."
