class MessagesController < ApplicationController
  before_create :send_message

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def show
    @message = Message.find(params[:id])
  end


  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Posted Sucessfully!!"
      redirect_to message_path
    else
      render :new
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:notice] = "Smell you later, post."
    redirect_to message_path
  end

  def initialize(attributes)
    @to = attributes['to']
    @from = attributes['from']
    @body = attributes['body']
  end
  
  private
  def message_params
    params.require(:message).permit(:to, :from, :body).merge(:user_id => current_user.id)
  end
end
