#notifications
output "sns_topic_arn" { value = "${aws_sns_topic.bc3_slack_notify.arn}" }