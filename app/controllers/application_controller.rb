class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  before_action  :principal
  #after_action  :resume_famille
  #after_action :resume_famille

  def principal
    @parent = Parent.new
    @enfant = Enfant.new
    @famille = list_famille
    #@info_parent= Parent.where(famille_id: list_famille.first.id)
    #@parent_id = @info_parent.last.id
    @info_enfant = Enfant.where(parent_id: @parent_id) if !@parent_id.nil?
  end

  def list_famille
    Famille.all
  end
end
