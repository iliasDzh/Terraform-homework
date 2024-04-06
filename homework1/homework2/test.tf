
resource "aws_iam_user" "girls" {
  for_each = toset([
    "jenny",
    "rose",
    "lisa",
    "jisoo",
  ])
  name = each.key
}

resource "aws_iam_group" "blackpink" {
  name = "blackpink"
}

resource "aws_iam_group_membership" "blackpink_membership" {
  for_each = aws_iam_user.girls

  name  = "${aws_iam_group.blackpink.name}_${each.key}"
  users = [each.value.name]
  group = aws_iam_group.blackpink.name
}
