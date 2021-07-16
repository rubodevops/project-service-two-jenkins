



source "amazon-ebs" "basic-example" {
  access_key    = ${AWS_ACCESS_KEY_ID}
  secret_key    = ${AWS_SECRET_ACCESS_KEY}
  region        = "us-east-2"
  source_ami    = "ami-00399ec92321828f5"
  instance_type = "t2.small"
  ssh_username  = "ubuntu"
  ami_name      = "packer_AWS_servicetwo_{{timestamp}}"
}

build {
  sources = [
    "source.amazon-ebs.basic-example"
  ]


provisioner "file"{
  source = "**/target/*.jar"
  destination = "/home/ubuntu/
}





  provisioner "ansible" {
    playbook_file = "./playbook-servicetwo.yml"
  }

}
