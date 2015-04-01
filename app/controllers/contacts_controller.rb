class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
    render :edit
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash[:notice] = "Contact edited!"
      redirect_to root_path
    else
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
