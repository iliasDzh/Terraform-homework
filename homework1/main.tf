#Create new repo terraform-homework in GitHub. Clone the repo and create folder Homework1, cd to the folder and write a Terraform script that:
# users: jenny, rose, lisa, jisoo
# users: jihyo, sana, momo, dahyun
# groups: blackpink, twice
# add users: jenny, rose, lisa, jisoo to the blackpink group
#add users: jihyo, sana, momo, dahyun to the twice group
#Create two users manually in AWS Console (attach 0 policies): miyeon and mina
#and import them to Terraform. (provide terraform import commands in main.tf file as a comment)
#Modify Terraform configuration file to add user miyeon to the blackpink group and user mina to the twice group and apply changes.
#Finally, run terraform destroy to confirm you can delete all resources: created by Terraform and manually created.
#Push the code to GitHub and send me GitHub URL.

resource "aws_iam_user" "user9" {
  name = "mina"
}

resource "aws_iam_user" "user10" {
  name = "miyeon"
}
resource "aws_iam_user" "user1" {
  name = "jenny"
}
resource "aws_iam_user" "user2" {
  name = "rose"
}

resource "aws_iam_user" "user3" {
  name = "lisa"
}
resource "aws_iam_user" "user4" {
  name = "jisoo"
}
resource "aws_iam_user" "user5" {
  name = "jihyo"
}
resource "aws_iam_user" "user6" {
  name = "sana"
}
resource "aws_iam_user" "user7" {
  name = "momo"
}
resource "aws_iam_user" "user8" {
  name = "dahyun"
}
resource "aws_iam_group" "group" {
  name = "blackpink"
}
resource "aws_iam_group" "group1" {
  name = "twice"
}

resource "aws_iam_group_membership" "team1" {
  name = "blackpinck-membership"
  users = [
    aws_iam_user.user1.name,
    aws_iam_user.user2.name,
    aws_iam_user.user3.name,
    aws_iam_user.user4.name,
    aws_iam_user.user10.name
  ]
  group = aws_iam_group.group.name
}



resource "aws_iam_group_membership" "team2" {
  name = "twice-membership"
  users = [
    aws_iam_user.user5.name,
    aws_iam_user.user6.name,
    aws_iam_user.user7.name,
    aws_iam_user.user8.name,
    aws_iam_user.user9.name
  ]
  group = aws_iam_group.group1.name
}

#terraform import aws_iam_user.user10  miyeon 
#terraform import aws_iam_user.user9 mina 