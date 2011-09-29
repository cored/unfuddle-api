module UnfuddleAPI
  class Base < ActiveResource::Base
    def self.inherited(base)
      UnfuddleAPI.resources << base
      class << base
        attr_accessor :site_format
      end
      base.site_format = '%s'
      super
    end
  end
end
