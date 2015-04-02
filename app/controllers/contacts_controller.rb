class ContactsController < ApplicationController
  def index
    @contacts = Contact.order(:name)
    @contact = Contact.new
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
    redirect_to contacts_path
    else
      flash[:alert] = "Disaster strikes"
      render :new
    end
  end

  def edit
    @contact = Contact.find(params[:id])
    render :edit
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash[:notice] = "Contact edited!"
      redirect_to root_path
    else
      flash[:notice] = "Worst Idea Ever"
      render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = "Contact deleted!"
    redirect_to root_path
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :user_number)
  end
end
