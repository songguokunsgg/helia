#########################################################################
# File Name: push.sh
# Author: songguokunsgg 
# mail: 516915016@qq.com
# Created Time: 2021年12月3日
#########################################################################
#!/bin/bash

if [ $# -eq 0 ]
then
    pushmessage=`date +%Y-%m-%d`
else
    pushmessage="$*"
fi

#pushmessage=`date +%Y-%m-%d`

echo ${pushmessage}

git add -A
git commit -m "${pushmessage}"
git push origin master
