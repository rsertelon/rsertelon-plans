#!/bin/bash

package_name=${1?:"Package name required"}
number_of_packages=${2:-1}
[ $number_of_packages -gt 1 ] && multiple_builds=1 || multiple_builds=

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
plan_dir="$script_dir/../$package_name"
plan_file="$plan_dir/plan.sh"

if [ -z $STUDIO_TYPE ]
then
  echo "Script must be used in habitat studio"
  exit 1
fi

if [ ! -f $plan_file ]
then
  echo "Plan $package_name cannot be built, couldn't find $plan_file"
  exit 2
fi

echo "About to run build $number_of_packages for package $package_name. Confirm? (Y/n)"
read confirm
if [ ! ${confirm:-Y} = "Y" ]; then
    exit 3
fi

pushd $plan_dir/..

#nominal build always expected
build $package_name

if [ ! -z $multiple_builds ]
then
  for i in `seq 1 $(($number_of_packages - 1))`
  do
    index=$i build $package_name
  done
fi

popd