class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @page_name = 'User'
  end

  private

  def set_user
    @user = GitHub::Api::Users::Get.new(params[:id]).perform
  end
end