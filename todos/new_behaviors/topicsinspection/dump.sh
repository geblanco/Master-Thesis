#!/bin/bash

if [[ $# -lt 2 ]]; then
  echo "Usage ./dump.sh <rosnode | rostopic> <topics_file>"
  exit 1
fi

cmd=$1; shift;
topics_file=$1; shift;
dump_dir="${cmd}_dump"

if [[ ! -f $topics_file ]]; then
  echo "Topics file does not exist"
  exit 2
fi

if [[ -d $dump_dir ]]; then
  rm -rf $dump_dir
fi

mkdir -p $dump_dir

topics=$(cat $topics_file | tr '\n' ' ')

for topic in ${topics[@]}; do
  name=$(echo $topic | cut -c 10-)
  `${cmd} info $topic > $dump_dir/$name`
done
