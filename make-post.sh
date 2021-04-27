#! /bin/bash
# $1 post file name
cd ./content/posts
#printf [-v var] format [arguments]
printf -v date '%(%Y-%m-%d)T' -1
filename="${date}-$1.md"
time=$(date +"%H:%M:%S")
user=$(whoami)
cat <<EOF > $filename
---
title:
date: $date $time
author: $user
draft: false
---
EOF
echo $filename
