# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_simpla_session',
  :secret      => 'c651ca8e1ddf1738babb4ceafb29f519f1ae8808bc6f6c8adea8b3f0d0dd14f87d58aa04ad85e123fe9d9fa4bf2e04db48b7b96fee9fb84efc1a232db8e1b8d5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
