resource "aws_sns_topic" "sns_topic" {
  name            = var.topic_name
  delivery_policy = var.delivery_policy
}
