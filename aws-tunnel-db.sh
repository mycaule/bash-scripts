#!/bin/bash

if [ $1 = "elastic" ]
then
  ssh -A -L 9200:<elastic-name<:9200 <user>@ -o "ProxyCommand=ssh -A <user>@<bastion-name> 'nc <front-name> 22'"
fi

if [ $1 = "rds" ]
then
  ssh -A -L 5432:<rds-name>:5432 <user>@ -o "ProxyCommand=ssh -A <user>@<bastion-name> 'nc <front-name> 22'"
fi
