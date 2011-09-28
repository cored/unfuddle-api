$: << File.dirname(__FILE__) unless $:.include?(File.dirname(__FILE__))

require 'rubygems'
require 'active_support'
require 'active_resource'

module UnfuddleAPI
  extend ActiveSupport::Autoload
  class Error < StandardError; end
  autoload :Base,        'unfuddle/base'
  autoload :Account,     'unfuddle/account'

  class << self
    def authenticate(username, password, subdomain)
      @username = username
      @password = password
      self::Base.user = username
      self::Base.password = password
    end

    def resources 
      @resources ||=[]
    end
  end
end
