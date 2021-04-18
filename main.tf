resource "google_compute_address" "static" {
  name = "ipv4-address"
}

resource "google_compute_firewall" "default" {
 name    = "jenkins-firewall"
 network = "default"

 allow {
   protocol = "icmp"
 }

 allow {
   protocol = "tcp"
   ports    = ["80", "8000", "9000","8080"]
 }
 source_ranges = ["0.0.0.0/0"]
 source_tags = ["jenkins"]

}

resource "google_compute_instance" "instance_with_ip" {
    name         = "ansible-docker-jenkins"
    machine_type = "e2-medium"
    zone         = "${var.zone}"

    boot_disk {
        initialize_params{
            image = "centos-cloud/centos-7"
        }
    }

    metadata = {
        ssh-keys = "${var.ssh_username}:${file(var.ssh_pub_key_path)}"
    }    
   
    network_interface {
        network = "default"
        access_config {
            nat_ip = "${google_compute_address.static.address}"
        }
    }
  provisioner "remote-exec" {
    connection {
      host        = "${google_compute_address.static.address}"
      type        = "ssh"
      user        = "${var.ssh_username}"
      timeout     = "500s"
      private_key = "${file(var.ssh_priv_key_path)}"
    }
    inline = [
      "sudo yum -y install epel-release",
    "sudo yum -y install ansible git python3 java python2-pip libselinux-python3",
     "sudo pip3 install docker",
     "sudo pip install pbr",
     "sudo pip install python-jenkins",
     "git clone https://github.com/christianvch/prueba01.git && cd prueba01",
     "sudo ansible-playbook install-docker.yml",
     "sudo pip install python-jenkins",
    "sudo ansible-playbook install-jenkins.yml"
    ]
  }

}
