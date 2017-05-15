provider "aws" {

    region = "${var.region}"

}

module "notifications" {

    source = "../../modules/notifications"

    project_name = "${var.project_name}"

    file_name = "${var.file_name}"
    runtime = "${var.runtime}"
    function_name = "${var.function_name}"
    role = "${var.role}"
    channel = "${var.channel}"
    username = "${var.username}"
    bc3_hook_id = "${var.bc3_hook_id}"
}