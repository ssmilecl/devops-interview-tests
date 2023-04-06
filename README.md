# devops-interview-tests
This is the interview test for Chenlu Shang
Exercise 1

I answer this question by Bash Scripting and run it and print out the result in Terminal (MacOS).
The first thing of this solution should be set the launch time
Then, I use the jq command to parse the JSON file and extract the values of the InstanceId and LaunchTime fields.
Finally, the script outputs the list of instance IDs that match the filter.
The result is :
"i-09e11531a55b6c294"
"i-00539f516dc94e4e2"
"i-043d78c4793b275a2"
"i-0e3026e586b5c280a"
"i-02d7057a3b583922f"

Exercise 2
I create an IAM user in the AWS console first and create the credentials for this user to connect with Terraform.

This Terraform module defines the three groups, group1, group2, and group3, using the aws_iam_group resource. It then defines the two users, jerome and marc, using the aws_iam_user resource. Finally, it creates the necessary group associations using the aws_iam_group_membership resource.

Exercise3 Dockerfile
I use alpine:latest as a base, then run a command to create the index.html file, in order to print the "Hello World"

Secondly, I use the "nginx:latest" as the base, then copy the index.html from pervious stage

Finally, use the CMD command to run when the container stars.

I map the image port 8000 on the host to port 80 and then access to http://localhost:8000 in the web browser, then "Hello World" comes up. Finally, I use both docker desktop and terminal to test.

Exercise 4
I create the policy in JSON format and I add the seperate JSON file for coding. Finally, I attach the policy to each person and group in my account.

Exercise 5
I create the init container to download the file from git and save to the /data/myfile.txt

Thank you in advance