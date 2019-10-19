provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

resource "random_id" "instance_id" {
  byte_length = 8
}

resource "google_compute_instance" "vm" {
  name         = "${var.instance_name}-${random_id.instance_id.hex}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"
  boot_disk {
    initialize_params {
      image = "${var.image}"
      size  = "${var.size}"
    }
  }

  network_interface {
    network = "default"
    access_config {} // use ephemeral public ip
  }

  tags = "${var.tags}"

  provisioner "local-exec" {
    command = "scp provision.sh vnc-user@${google_compute_instance.vm.network_interface.0.access_config.0.nat_ip}:/home/vnc-user/"
  }
}

resource "google_compute_firewall" "default" {
  name    = "${var.firewall_rule_name}"
  network = "default"

  allow {
    protocol = "${var.protocol}"
    ports    = "${var.ports}"
  }

  source_ranges = "${var.source_ranges}"

  target_tags = "${var.target_tags}"
}

resource "google_compute_project_metadata" "default" {
  metadata = {
    ssh-keys = "${var.ssh_user}:${file("${var.ssh_public_key_path}")}"
  }
}

output "public_ip" {
  value = "${google_compute_instance.vm.network_interface.0.access_config.0.nat_ip}"
}
