class RootController < ApplicationController
  include ApplicationHelper

  def index
  end

  def redirection_principal
    redirect_to principal_application_index_path
  end
end
