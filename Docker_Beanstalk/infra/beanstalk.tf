resource "aws_elastic_beanstalk_application" "aplication_beanstalk" {
  name        = var.nome
  description = var.description
}

resource "aws_elastic_beanstalk_environment" "environment_beanstalk" {
  name                = var.ambiente
  application         = aws_elastic_beanstalk_application.aplication_beanstalk.name
  solution_stack_name = "64bit Amazon Linux 2 v3.4.19 running Docker"

setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.max
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_ec2_profile.name
  }

}

resource "aws_elastic_beanstalk_application_version" "default" {
  depends_on = [
    aws_elastic_beanstalk_environment.environment_beanstalk,
    aws_elastic_beanstalk_application.aplication_beanstalk,
    aws_s3_bucket_object.docker
  ]
  name        = var.ambiente
  application = var.nome
  description = var.description
  bucket      = aws_s3_bucket.beanstalk_deploys_nilson.id
  key         = aws_s3_bucket_object.docker.id
}