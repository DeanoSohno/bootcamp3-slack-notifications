data "aws_iam_policy_document" "bc3_assume_role" {  
    statement {
        effect = "Allow"
        actions = [
            "sts:AssumeRole",
        ]
        principals {
            type = "Service"
            identifiers = ["lambda.amazonaws.com"]
        }
    }
}

data "aws_iam_policy_document" "bc3_slack_notify" {  
    statement {
        sid = "CloudwatchLogs"
        effect = "Allow"
        actions = [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:GetLogEvents",
            "logs:PutLogEvents"
        ]
        resources = ["arn:aws:logs:*:*:*"]
    }
}

resource "aws_iam_role" "bc3_slack_notify_role" {  
    name = "bc3SlackNotifications"
    assume_role_policy = "${data.aws_iam_policy_document.bc3_assume_role.json}"
}

resource "aws_iam_role_policy" "bc3_slack_notify_policyrole" {  
    name = "bc3SlackNotifications"
    role = "${aws_iam_role.bc3_slack_notify_role.id}"
    policy = "${data.aws_iam_policy_document.bc3_slack_notify.json}"
}