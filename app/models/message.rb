class Message < ActiveRecord::Base
  before_create :send_messages
  belongs_to :user
  private

  def send_messages
    valid = true
    to.split(", ").each do |to_number|

      begin
        response = RestClient::Request.new(
        :method => :post,
        :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
        :user => ENV['TWILIO_ACCOUNT_SID'],
        :password => ENV['TWILIO_AUTH_TOKEN'],
        :payload => { :Body => body,
          :To => to_number,
          :From => from, }
          ).execute

       rescue RestClient::BadRequest => error
        message = JSON.parse(error.response)['message']
        errors.add(:base, message)
        valid = false
        return valid
      end
    end
  end
end
