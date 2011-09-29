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
    attr_accessor :username, :password, :host_format, :domain_format, :protocol, :port
    attr_reader :account

    def account=(name)
      resources.each do |klass|
        klass.site = klass.site_format % (host_format % [protocol, domain_format % name, ":#{port}"])
      end
      @account = name
    end

    def authenticate(username, password, subdomain)
      @username = username
      @password = password
      account = subdomain
      self::Base.user = username
      self::Base.password = password
    end

    def resources 
      @resources ||=[]
    end
  end

  self.host_format = '%s://%s%s/api/v1/'
  self.domain_format = '%s.unfuddle.com'
  self.protocol = 'http'
  self.port = ''
end
