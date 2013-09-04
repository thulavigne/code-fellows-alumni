# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Alumni::Application.config.secret_token = if Rails.env.development? or Rails.env.test?
  'b9161ca7a5d4c00fc6d59df8aed0462cecb5313a315bb87f53d7a65ff45468f4cbdce50eed44d8d3e1ab07f80e6584e33cb137358a13b63809a4ad068ea01d86'
else
  'b9161ca7a5d4c00fc6d59df8aed0462cecb5313a315bb87f53d7a65ff45468fb9161ca7a5d4c00fc6d59df8aed0462cecb5313a315bb87f53d7a65ff45468f'
end
