provider "aws" {

    region = "${var.region}"

}

module "notifications" {

    source = "../../modules/notifications"

    name = "${var.name}"
}