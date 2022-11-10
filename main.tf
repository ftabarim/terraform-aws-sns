terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.28.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "lab"
}

module "topic" {
  for_each   = toset(["topic-tabarim", "topic-patrick", "topic-natalie"])
  source     = "./modules/sns_topic"
  topic_name = each.value
}

module "subscription-tabarim" {
  for_each  = toset(["fetabarim@gmail.com", "fetabarim@outlook.com"])
  source    = "./modules/sns_subscription"
  endpoint  = each.value
  protocol  = "email"
  topic_arn = module.topic["topic-tabarim"].sns_topic
}

module "subscription-patrick" {
  for_each  = toset(["patriick.f@gmail.com", "tiicke_@hotmail.com"])
  source    = "./modules/sns_subscription"
  endpoint  = each.value
  protocol  = "email"
  topic_arn = module.topic["topic-patrick"].sns_topic
}

module "subscription-natalie" {
  for_each  = toset(["nat_bortoluzzi@hotmail.com"])
  source    = "./modules/sns_subscription"
  endpoint  = each.value
  protocol  = "email"
  topic_arn = module.topic["topic-natalie"].sns_topic
}
