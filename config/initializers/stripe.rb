Rails.configuration.stripe = {
  :publishable_key => 'pk_test_TYooMQauvdEDq54NiTphI7jx',
  :secret_key      => 'sk_test_4eC39HqLyjWDarjtT1zdp7dc'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
