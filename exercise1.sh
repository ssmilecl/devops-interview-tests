#!/bin/bash

# Set the launch time cutoff
cutoff="2022-04-12T13:00:00"

# Use jq command parse the JSON file and retrieve the InstanceIds launched before the cutoff date
#Extract the Instanceld for each macthcing instance
cat ec2-describe-instances.json | jq '.Reservations[].Instances[] | select(.LaunchTime < "'"$cutoff"'") | .InstanceId'

# Print the retrieved InstanceIds
echo "$instance_ids"
