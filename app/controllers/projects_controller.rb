class ProjectsController < ApplicationController
  before_action :set_search_result, only: [:index]
  before_action :set_project, only: [:show]
  before_action :set_contributors, only: [:show]

  def index
    @page_name = 'Search'
  end

  def show
    @page_name = 'Main'
  end

  private

  def set_search_result
    @result = GitHub::Api::Projects::Search.new(params[:search]).perform
  end

  def set_project
    @project = GitHub::Api::Projects::Get.new(params[:id], params[:owner]).perform
  end

  def set_contributors
    @contributors = GitHub::Api::Projects::Contributors.new(params[:id], params[:owner]).perform
  end
end