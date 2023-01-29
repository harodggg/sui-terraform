variable "project" {
    default = "quantum-gearbox-376023" // google cloud project id
 }

variable "credentials_file" {
    default = "sui_gcp_terraform_1.json"
 }

 variable "gcp_providers_config" {
        type = list(
                object({
                gcp_name = string,
                node_num = number,
                credentials_file = string
        }))

        default = [
        {
                gcp_name = "g1",
                node_num = 2,
                credentials_file = "sui_gcp_terraform_1.json"
        }]
        }


variable "region" {
  default = "us-west1"
}

variable "zone" {
  default = "us-west1-b"
}

variable "sui_instance_num" { 
    default = 5
}

variable "sui_instance_pubkey" {
    default = <<-EOF
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCy6VPsCvmi8SZyTjRny7AMK1LAhWPxhK0yAQTJ2Skcn/8uWEcPuFJbGIN1GfdNWzajk4+dly5TL3ZmC2Bt3KSVRxkn7SLSIOC++xbmlSNt4G2Bk/QcF0vD/la57CsqFIwr8/ZIjuC0zRyu6XCI+4iISseW6Rh6YFYX0t9ZhXH781kSJRIsLlKOQAELBvgGr2XMxuYMiRQr20h2UOnnPtEPZvlLqYIzzLjDRlUfX0f4cHRnEkspVYER6quUfLdD1b/pTcaRx1/gHY8XIWYCKyJAk0xQcuVXrNZe44aouBWisuSt4Jofv5sGZ2nBFjNUq/Hwu0PffKUiiz+ifzMLbSlV085CvQoQ8aqMntHyDmIvIi5OWC7xR3KqzOpyzUtBAwiubUMlogmixAGlsEVOW2vUt/KOFKmuk1EEY62YDn+72ICOdqB3BoXIkJZl84ax1KaFjrv+YIiyJgDztsaBxNrC8b+PuU2RT4c7/ZXPXR+sjcTe0Qp5PeXRpfHmhZ9z1Ik= "
    EOF
}

variable "sui_disk_size" { 
    default = 500    // 500G disk size
}

variable "sui_machine_type" { 
    default = "f1-micro"
}

