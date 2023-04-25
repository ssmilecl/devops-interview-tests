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

##This Terraform module defines the three groups, group1, group2, and group3, using the aws_iam_group resource. It then defines the two users, jerome and marc, using the aws_iam_user resource. Finally, it creates the necessary group associations using the aws_iam_group_membership resource.##

/***I modify this answer by using the local variable which is provided. 
Use the count parameter is set to the length of the users local variable. The name parameter is set to the groups array of the user object at the current index, in order to creates IAM groups.
And the to reates IAM users. The count parameter is set to the length of the users local variable. The name parameter is set to the username of the user object at the current index.
Last but not least, I need to create associates IAM users with their groups. The count parameter is set to the length of the users local variable. The user parameter is set to the name of the user at the current index. The groups parameter is set to a list containing the name of the group at the current index.

However, I noticed that when I run terraform plan and terraform apply, the group2 is not created. So I add two output line in the file
output "group_names" {
  value = aws_iam_group.groups[*].name
}
output "user_info" {
  value = { for user in keys(local.users) : user => {
    groups = aws_iam_user_group_membership.group_membership[*].groups[count.index] if lookup(local.users[user], "groups", []) != []
  } }
}

But the result is confused 
The output is 
group_names = [
    "group1",
    "group3",
    ]

user_info = {
    user1 = {
    groups = [
        "group1",
        "group2",
        ]
    }
user2 = {
    groups = [
        "group2",
        "group3",
        ]
     }
    } 

Sorry, based on my current knowledge of Terraform, I couldn't fix this bug eventually.***/

I use the for_each argument creates multiple instances of the aws_iam_group resource by iterating over the flattened unique set of all the groups from the local.users variable. The name argument is set to the group name which is each key from the for_each set.

Similarly, using for_each argument creates multiple instances of the aws_iam_user resource by iterating over the local.users variable. The name argument is set to the username which is each value from the for_each map.

Last but not least, the final block creates the association between IAM users and their respective groups using the aws_iam_user_group_membership resource type. The for_each argument creates multiple instances of the aws_iam_user_group_membership resource by iterating over the local.users map. The user argument is set to the username of each user from the local.users map. The groups argument is set to the list of groups of each user from the local.users map. The depends_on argument specifies that this resource depends on the aws_iam_user and aws_iam_group resources to ensure they are created before creating the group memberships.

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