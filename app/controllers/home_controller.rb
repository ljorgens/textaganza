class HomeController < ApplicationController
  def index
    @message = Message.new
    @contact = Contact.new
    @contacts = Contact.all
  end
end
