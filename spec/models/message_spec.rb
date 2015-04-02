require 'rails_helper'

describe Message, :vcr => true do
  it { should belong_to :user }

  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '11', :from => '4159157590')
    expect(message.save).to be false
  end

  it 'adds an error if the to number is invalid' do
    message = Message.new(:body => 'hi', :to => '11', :from => '4159157590')
    message.save
    expect(message.errors[:base]).to eq ["The 'To' number 11 is not a valid phone number."]
  end
end
