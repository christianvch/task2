provider "google" {
 credentials = "${file(var.gcp_credentials_path)}"
 project     = "${var.project_name}"
 region      = "${var.region}"
}
