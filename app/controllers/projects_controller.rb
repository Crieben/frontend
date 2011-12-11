class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource



  def github_show
    url = Backend.blocking_worker "circle.backend.github-url/canonical-url", params[:user], params[:project]
    @project = Project.where(vcs_url: url).first
    render "show"
  end

end
