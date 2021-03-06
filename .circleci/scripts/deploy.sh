#!/bin/bash

# arguments
while [[ "$#" > 0 ]]; do case $1 in
  -p|--profile) PROFILE="$2"; shift;;
  *) echo -e "\033[31m Unknown option \033[0m"; usage; exit 1;;
esac; shift; done

# Create temporary credentials for AWS
temp_role=$(aws sts assume-role --role-arn "$PROFILE" --role-session-name my-sls-session --out json)
# Export the keys for AWS CLI access
export AWS_ACCESS_KEY_ID=$(echo $temp_role | jq -r '.Credentials.AccessKeyId')
export AWS_SECRET_ACCESS_KEY=$(echo $temp_role | jq -r '.Credentials.SecretAccessKey')
export AWS_SESSION_TOKEN=$(echo $temp_role | jq -r '.Credentials.SessionToken')