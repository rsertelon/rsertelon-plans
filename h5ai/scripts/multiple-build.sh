#!/bin/bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
results_dir="$script_dir/../../results"

number_of_packages=$1

for i in `seq 1 $number_of_packages`
do
  index=$i build $script_dir/..
  source $results_dir/last_build.env
  hab pkg upload $results_dir/$pkg_artifact
  hab pkg promote $pkg_ident stable
done