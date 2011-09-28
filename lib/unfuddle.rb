$: << File.dirname(__FILE__) unless $:.include?(File.dirname(__FILE__))

require 'rubygems'
require 'active_support'
require 'active_resource'
require 'unfuddle/base'

module UnfuddleAPI
  class Error < StandardError; end

  class << self
    def authenticate(username, password)
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
