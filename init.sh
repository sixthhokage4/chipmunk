#!/bin/bash
echo "chipmunk init script called"
#TODO check dependancys - all programs used
#ffmpeg, touch, cat, 

#check if directory ~/.chipmunk exists, create if not
#cant have spaces in dir name as that would need quotes, but quotes prevent expansion of '~' so :)
DIRECTORY=~/.chipmunk/	

if [ ! -d "$DIRECTORY" ] 
then
	mkdir "$DIRECTORY"
	echo "${DIRECTORY} directory created"
fi

#check if ~/chipmunk/index.json exists, create if not

if [ ! -e "${DIRECTORY}index.json" ]
then
	touch "${DIRECTORY}index.json"
	> "${DIRECTORY}index.json"	
	echo "{\"entries\":[]}" > "${DIRECTORY}index.json"
	echo "${DIRECTORY}index.json created"
fi

#check if ~/chipmunk/prefs file exists, create if not & populate with text (like username and psswd for upload site, api key if necc'y)

#if [ ! -e "${DIRECTORY}prefs" ]
#then
#	touch "${DIRECTORY}prefs"
#	>"${DIRECTORY}prefs"
#	echo "prefs file created"
#	
#fi

#TODO change above to include client-secrets.json for yt upload
#ensure client secrets exists, if not, touch file & call create_client_screts.py
if [ ! -e "${DIRECTORY}client_secrets.json" ]
then
	touch "${DIRECTORY}client_secrets.json"
	./create_client_secrets.py
	echo "fill out ~/.chipmunk/client_secrets.json with your oauth credentials to access the youtube API"
fi

#ensure ~/.chipmunk/.current_hash exists, then clear it

if [ ! -e "${DIRECTORY}.current_hash" ]
then
	touch "${DIRECTORY}.current_hash"
	echo ".current_hash file created.."
fi

>"${DIRECTORY}.current_hash"
echo ".current_hash file cleared"

#ensure ~/.chipmunk/.current_dir exists, then clear it

if [ ! -e "${DIRECTORY}.current_dir" ] 
then
	touch "${DIRECTORY}.current_dir"
	echo ".current_dir file created"
fi

>"${DIRECTORY}.current_dir"
echo "current_dir file cleared"

