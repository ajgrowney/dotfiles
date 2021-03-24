#!/bin/bash

## User release branches
function gcobur(){
  git checkout -b users/growney/release/$1
}
function gcor(){
  git checkout release/$1
}
function gcour(){
  git checkout users/growney/release/$1
}
function gpuour(){
  git push -u origin users/growney/release/$1
}
function gbdur(){
  git branch -d users/growney/release/$1
}
function cda(){
  cd ~/Code/atx/atx-$1-dev/
}
