#!/bin/bash
function atonixLibraries(){
  start msedge "https://dev.azure.com/AtonixDigital/Asset360/_packaging?_a=feed&feed=Atonix-Libraries"
}

function checkAtxPackages() {
  cd ~/Code/atx/atx-utility-dev/atx-utility-nugetwiki/
  py mostRecentArtifacts.py
}

function memFinder(){
  echo " Private Members"
  grep 'private .*' $1 | grep -v '[(].*[)]' | sed -e 's/^[ \t]*/ /'
  echo " "
  echo " Public Members"
  grep 'public .*' $1 | grep -v '[(].*[)]' | sed -e 's/^[ \t]*/ /'
}

function fcnFinder(){
  echo " Private Functions"
  grep 'private.*[(].*[)]' $1 | sed -e 's/^[ \t]*/ /' 
  echo " "
  echo " Public Functions"
  grep 'public.*[(].*[)]' $1 | sed -e 's/^[ \t]*/ /' 
}

function classDocGen(){
  echo "## $1"
  echo "---"
  echo "### Private Member Variables"
  grep 'private.*' $1 | grep -v '[(].*[)]' | sed -e 's/^[ \t]*/#### /' | sed -e 's/$/ \nDescription: \n/'
  echo "### Public Member Variables"
 grep 'public.*' $1 | grep -v '[(].*[)]' | sed -e 's/^[ \t]*/#### /' | sed -e 's/$/ \nDescription: \n/'
  echo "### Private Member Functions"
 grep 'private.*[(].*[)]' $1 | sed -e 's/^[ \t]*/#### /' | sed -e 's/$/ \nDescription: \n/'
  echo "### Public Member Functions"
 grep 'public.*[(].*[)]' $1 | sed -e 's/^[ \t]*/#### /' | sed -e 's/$/ \nDescription: \n/'
}

function fcnFinderFormatterAll(){
 grep 'public\|private.*[(].*[)]' $1 | sed -e 's/^[ \t]*/#### /' | sed -e 's/$/ \nDescription: \n/'
}

function enableVSCodeDebug() {
  export VSTEST_HOST_DEBUG=1
}

function disableVSCodeDebug() {
  export VSTEST_HOST_DEBUG=0
}
