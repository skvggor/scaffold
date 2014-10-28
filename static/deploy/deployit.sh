#!/bin/bash

file_or_directory=`awk -F", " '{print $1}' config`;
ssh_data=`awk -F", " '{print $2}' config`;
destination=`awk -F", " '{print $3}' config`;

deployit () {
  if [[ $file_or_directory && $ssh_data && $destination ]]; then
    # rsync -avz -e 'ssh -p 2222' $file_or_directory $ssh_data:$destination
    rsync -avz -e ssh $file_or_directory $ssh_data:$destination
  else
    echo -e "Missing parameter (s).";
  fi
}

initializer() {
  deployit;
}

initializer;
