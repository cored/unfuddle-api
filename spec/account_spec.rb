require File.expand_path(File.dirname(__FILE__)) + '/spec_helper'

describe "UnfuddleAPI::Acount" do 
  it "should retrieve account information" do 
    pending
    UnfuddleAPI.authenticate('username', 'password', 'account')
    account = UnfuddleAPI::Account.find(:first)
    account.should_not be_nil
  end
end
