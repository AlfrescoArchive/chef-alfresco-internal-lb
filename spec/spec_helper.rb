require 'chefspec'
require 'chefspec/berkshelf'
require_relative 'support/matchers'

# Require all our libraries
Dir['libraries/*.rb'].each { |f| require File.expand_path(f) }

at_exit { ChefSpec::Coverage.report! }
