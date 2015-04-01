require 'rails_helper'

describe Message, :vcr => true do
  it { should belong_to :user }

  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '5039463641')
    expect(message.save).to be_falsey
  end
end
