Koudoku.setup do |config|
  config.webhooks_api_key = "176101c6-abd4-443a-8a3f-aa83e1707ae1"
  config.subscriptions_owned_by = :account
  config.stripe_publishable_key = ENV['STRIPE_PUBLISHABLE_KEY']
  config.stripe_secret_key = ENV['STRIPE_SECRET_KEY']
  # config.prorate = false # Default is true, set to false to disable prorating subscriptions
  # config.free_trial_length = 30
end
