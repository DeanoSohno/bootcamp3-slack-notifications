data "archive_file" "bc3_slack_notify_js" {
  type = "zip"
  source_file = "../../lambda/${var.file_name}.js"
  output_path = "../../lambda/${var.file_name}.zip"
}

resource "aws_lambda_function" "bc3_slack_notify_lambda" {
  depends_on = ["data.archive_file.bc3_slack_notify_js"]

  function_name = "${var.function_name}"
  description = "Send notifications to Slack form code start"

  runtime = "${var.runtime}"
  handler = "${var.file_name}.handler"

  role = "${aws_iam_role.bc3_slack_notify_role.arn}"

  filename = "${data.archive_file.bc3_slack_notify_js.output_path}"
  source_code_hash = "${base64sha256(file(data.archive_file.bc3_slack_notify_js.output_path))}"

  environment {
    variables {
      SLACK_CHANNEL = "${var.channel}"
      SLACK_USERNAME = "${var.username}"
      SLACK_WEBHOOK = "${var.bc3_hook_id}"
    }
  }
}

output "file_path" { value = "${data.archive_file.bc3_slack_notify_js.output_path}"}