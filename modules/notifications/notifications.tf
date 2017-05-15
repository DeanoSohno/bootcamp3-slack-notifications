resource "aws_sns_topic" "bc3_slack_notify" {  
    name = "${var.project_name}_slack_notify"
    display_name = "${var.project_name}_slack_notify"
}