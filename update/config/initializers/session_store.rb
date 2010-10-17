# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_update_session',
  :secret      => '314316ba1f76991fb97d31a7114e2f30db4cb7ab67c8f6e72d9359aa2c48e178a680749934ce31cce9b11c47160b8476fb1980eafa2e30c0737b1a7ee9c15f42'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
