#----------------------------------------------------------------------------
# Set up Mongoid
#----------------------------------------------------------------------------
say "creating 'config/mongoid.yml' Mongoid configuration file..."
run 'rails generate mongoid:config'
