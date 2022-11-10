variable "topic_name" {
  type = string
}

variable "delivery_policy" {
  type    = string
  default = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "backoffFunction": "linear",
      "maxDelayTarget": 20,
      "minDelayTarget": 20,
      "numMaxDelayRetries": 0,
      "numMinDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numRetries": 3
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOF
}
