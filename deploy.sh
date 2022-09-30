#!/bin/bash

home="/home/"
user=$(whoami)
projectpath="/Documents/EpamProject/deploy/"
path="$home$user$projectpath"
cd ${path}
	terraform init 
    terraform plan
    terraform apply --auto-approve