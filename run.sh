#!/bin/bash
# Simple helper to init, plan, apply, and destroy
ACTION=$1
NAME_PREFIX=${2:-FirstName_Lastname}
REGION=${3:-ap-south-1}

if [ "$ACTION" = "apply" ]; then
  terraform init
  terraform apply -var="name_prefix=${NAME_PREFIX}" -var="aws_region=${REGION}" -auto-approve
elif [ "$ACTION" = "destroy" ]; then
  terraform destroy -var="name_prefix=${NAME_PREFIX}" -var="aws_region=${REGION}" -auto-approve
else
  echo "Usage: ./run.sh [apply|destroy] [Name_Prefix] [aws_region]"
fi
