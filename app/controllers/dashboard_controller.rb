class DashboardController < ApplicationController
  before_action :authenticate_user! # this will protect the page when not signed in

  def index
  end
end
