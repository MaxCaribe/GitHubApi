class ProjectsController < ApplicationController
  before_action :set_project, only: :show

  def index
    @result = GitHub::Api::Projects::Search.new(params[:search]).perform
  end

  def show

  end

  private

  def set_project
    @project = GitHub::Api::Projects::Get.new(params[:id], params[:owner]).perform
  end
end