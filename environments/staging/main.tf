provider "aws" {

    region = "${var.region}"

}

module "notifications" {

    source = "../../modules/notifications"

    name = "${var.project_name}"

    runtime = "${var.runtime}"
    function_name = "${var.function_name}"
    role = "${var.role}"
    channel = "${var.channel}"
    username = "${var.username}"
    bc3_hook_id = "${var.bc3_hook_id}"
}