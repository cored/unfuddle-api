require File.expand_path(File.dirname(__FILE__)) + '/spec_helper'

describe "UnfuddleAPI::Acount" do 
  before(:each) do 
    ActiveResource::HttpMock.respond_to do |mock|
    end
  end

  it "should retrieve account information" do 
    UnfuddleAPI.authenticate('username', 'password', 'account')
    account = UnfuddleAPI::Account.find(:all)
    account.should_not be_nil
  end
end
