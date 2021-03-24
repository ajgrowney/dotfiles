#!/bin/bash

function ar()
{
  if [ $1 == "delete" ]; then

  	repoid=`az repos show --organization https://dev.azure.com/GrowneyA --project Atx360 -r $2 | jq -r .id`
  	echo $repoid
  	az repos delete --organization https://dev.azure.com/GrowneyA --project Atx360 --yes --id $repoid 
  elif [ $1 == "list" -a $2 == "pr" ]; then
	  repoid=`curl -u GrowneyA@atonix.com:$Asset360ApiKey -s https://dev.azure.com/AtonixDigital/Asset360/_apis/git/repositories | jq --arg name $3 '.value[] | select (.name==$name) | .id' | sed 's/"//g'`
	  curl -u GrowneyA@atonix.com:$Asset360ApiKey -s https://dev.azure.com/AtonixDigital/Asset360/_apis/git/repositories/$repoid/pullrequests | jq '.value[].url'

  else 
  	if [ $# -eq 0 ]; then
		r=`basename ${PWD}`
		start msedge "dev.azure.com/AtonixDigital/Asset360/_git/$r"
	else
  		start msedge "dev.azure.com/AtonixDigital/Asset360/_git/$1"
	fi
  fi
}
function arorg()
{
  start msedge "dev.azure.com/$1/$2/_git/$3"
}
function ardelrepo()
{
  ar "delete" $1
}

function ab()
{
  if [ $1 == "get" -a $2 == "artifacts" ]; then
	  curl -u GrowneyA@atonix.com:$Asset360ApiKey https://dev.azure.com/AtonixDigital/Asset360/_apis/build/builds/$3/artifacts | jq -r '.value[] | ("\n" + .name + "\n\n" + .resource.downloadUrl)'
  elif [ $1 == "get" -a $2 == "pipeline" ]; then
	  if [ -z $3 ]; then pname=`basename ${PWD}`; else pname=$3; fi
	  curlaz https://dev.azure.com/AtonixDigital/Asset360/_apis/build/definitions?name=$pname | jq '.value[].id' | (read p1; start msedge "https://dev.azure.com/AtonixDigital/Asset360/_build?definitionId=$p1")
  elif [$1 == "delete" -a $2 == "repo" ]; then
	  repoid=`az repos show --organization https://dev.azure.com/GrowneyA --project Atx360 -r $3 | jq -r .id`
	  echo $repoid
	  az repos delete --organization https://dev.azure.com/GrowneyA --project Atx360 --yes --id $repoid
  else
	  echo "get [artifacts, pipeline]"
  fi
}
function abViewPipeline()
{
  ab "get" "pipeline" $1
}
function adoAsset360()
{
  start msedge "dev.azure.com/AtonixDigital/Asset360"
}
