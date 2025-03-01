resource "aws_sns_topic" "billing_monitoring" {
  name = "billing_monitoring"
  delivery_policy = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 30,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOF
}

resource "aws_budgets_budget" "cost" {
  name              = var.budget_name
  budget_type       = var.budget_type
  limit_amount      = var.limit_amount
  limit_unit        = var.limit_unit
  time_period_start = formatdate("YYYY-MM-DD_hh:mm", timestamp())
  time_unit         = var.time_unit

  cost_types {
    include_credit             = false
    include_discount           = false
    include_other_subscription = false
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 50
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = var.subscriber_email_addresses
    subscriber_sns_topic_arns  = [aws_sns_topic.billing_monitoring.arn]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 80
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = var.subscriber_email_addresses
    subscriber_sns_topic_arns  = [aws_sns_topic.billing_monitoring.arn]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = var.subscriber_email_addresses
    subscriber_sns_topic_arns  = [aws_sns_topic.billing_monitoring.arn]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 120
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = var.subscriber_email_addresses
    subscriber_sns_topic_arns  = [aws_sns_topic.billing_monitoring.arn]
  }
}