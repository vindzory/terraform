provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  count         = 2
  ami           = "ami-0230bd60aa48260c6"
  instance_type = "t2.micro"
  key_name      = "msych"  

  tags = {
    Name = "${count.index == 0 ? "dan_sych" : "dan_sych2"}"
  }

  provisioner "local-exec" {
    command = <<EOT
      echo "[${count.index == 0 ? "dan_sych" : "dan_sych2"}]" >> ../inventory
      echo "${self.public_ip}" >> ../inventory
    EOT
  }
}

output "instance_ips" {
  value = aws_instance.example.*.public_ip
}
