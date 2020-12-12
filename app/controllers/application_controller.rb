class ApplicationController < ActionController::Base

  before_action  :principal
  #after_action :resume_famille

  def index
  end

  def principal
    @parent = Parent.new
    @enfant = Enfant.new
    @famille = list_famille
    #@info_parent = Parent.where(famille_id: list_famille.first.id)
  end

  def resume_famille
    @info_parent = Parent.find_by_famille_id(params[:parent][:famille_id])
    puts '*******ANALYSE***********'
    puts @info_parent.inspect
    @parent_id = @info_parent.id
    @info_enfant = Enfant.where(parent_id: @parent_id) if !@parent_id.nil?
    redirect_to resume_application_index_path
  end

  def create_parent
    puts params[:parent][:annee_naissance_pere]
    @parent = Parent.last
    @parent.update(prenom_pere: params[:parent][:prenom_pere],prenom_mere: params[:parent][:prenom_mere], annee_naissance_pere: params[:parent][:annee_naissance_pere], annee_naissance_mere: params[:parent][:annee_naissance_mere])
    @parent.save!

    #si les parent ont des enfant on lui attribue par défault le parent_id à l'enfant
    redirect_to principal_application_index_path
  end

  def get_familly
    @parent.update(famille_id: params[:parent][:famille_id])
    @parent.save
    redirect_to principal_application_index_path
  end

  def create_enfant
    puts params[:enfant][:annee_naissance]
    parent_id = Parent.last.id
    @enfant.update(prenom: params[:enfant][:prenom], annee_naissance: params[:enfant][:annee_naissance], parent_id: parent_id)
    @enfant.save!
    redirect_to principal_application_index_path
  end

  def list_famille
      Famille.all
  end

  def create_auto_famille
    Famille.create(nom:'Ulrish')
  end

  def famille
    Famille.all
  end
end
