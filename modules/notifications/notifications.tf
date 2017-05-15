resource "aws_sns_topic" "bc3_slack_notify" {  
    name = "${var.name}_slack_notify"
    display_name = "${var.name}_slack_notify"
}