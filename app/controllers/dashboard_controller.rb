class DashboardController < ApplicationController
  before_action :authenticate_user! # this will protect the page when not signed in
  # before_action :set_contact, only: [:show]
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
     # @user = current_user
     # @contacts = @user.contacts.all
    # @contacts = Contact.all
     @contacts = current_user.contacts
     @tasks = Task.order("position")
  end

  def show
    @contact = Contact.find(params[:id])
  end

   def sort
     params[:task].each_with_index do |id, index|
        Task.where(id: id).update_all(position: index + 1)
     end 
  end

  # private
  #  # Use callbacks to share common setup or constraints between actions.
  #  def set_contact
  #    @contact = contact.find(params[:id])
  #  end

  #  def contact_params
  #     params.require(:contact).permit(:name, :company, :email)
  #  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :start, :deadline, :status, :user_id)
    end
end
