resource "aws_lambda_permission" "with_sns" {
  statement_id = "AllowExecutionFromSNS"
  action = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.bc3_slack_notify_lambda.arn}"
  principal = "sns.amazonaws.com"
  source_arn = "${aws_sns_topic.bc3_slack_notify.arn}"
}

resource "aws_sns_topic_subscription" "lambda" {
depends_on = ["aws_lambda_permission.with_sns"]
topic_arn = "${aws_sns_topic.bc3_slack_notify.arn}"
protocol = "lambda"
endpoint = "${aws_lambda_function.bc3_slack_notify_lambda.arn}"
}