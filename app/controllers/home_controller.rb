class HomeController < ApplicationController

  def index
    # @contacts = Contact.all.limit(5)
  end

  private

  # def contact_params
  #   params.require(:contact).permit(:name, :email, :company, :address, :phone, :group_id, :avatar)
  # end

end
