if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_YxNoPiAzbXTxtGK3qOWP7UfM',
    secret_key: 'sk_test_CzOgWrcQdwT6X0wTNBuEPxSH'
  }
end

Stripe.api_key =
Rails.configuration.stripe[:secret_key]
