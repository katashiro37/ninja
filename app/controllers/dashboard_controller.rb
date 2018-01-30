class DashboardController < ApplicationController
  before_action :authenticate_user! # this will protect the page when not signed in
  # before_action :set_contact, only: [:show]

  def index
     # @user = current_user
     # @contacts = @user.contacts.all
    # @contacts = Contact.all
     @contacts = current_user.contacts
  end

  def show
    @contact = Contact.find(params[:id])
  end

  # private
  #  # Use callbacks to share common setup or constraints between actions.
  #  def set_contact
  #    @contact = contact.find(params[:id])
  #  end

  #  def contact_params
  #     params.require(:contact).permit(:name, :company, :email)
  #  end
end
