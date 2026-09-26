resource "aws_security_group" "ssh_rules"{
  name="ssh_rule"
  description="giving inbound ssh rule"
  ingress{
    to_port=22
    from_port=22
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]

  }
  egress{
    to_port=0
    from_port=0
    protocol="-1"
    cidr_blocks=["0.0.0.0/0"]
  
  }
}  

resource "aws_security_group" "http_rule"{
  name="http_rule"
  description="this rule will allow port 80"
  ingress{
    to_port=80
    from_port=80
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
  }
  egress{
    to_port=0
    from_port=0
    protocol="-1"
    cidr_blocks=["0.0.0.0/0"]
  }
}


resource "aws_instance" "web1"{
	instance_type=var.AWS_INSTANCE_TYPE
	ami=var.AWS_AMI
  vpc_security_group_ids=[aws_security_group.ssh_rules.id,aws_security_group.http_rule.id]
  
	tags={
		name="webserver1"
	}
}
