Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #Routage à la page principal au moment du lancement de l'familles
  root :to =>'root#redirection_principal'

  namespace :application do
    get 'principal'
    get 'resume'
  end
  namespace :familles do
    post 'resume_famille' => 'familles#resume_famille'
    post 'create_parent' => 'familles#create_parent'
    post 'create_enfant' => 'familles#create_enfant'
    post 'familles' => 'familles#familles'
    #post 'resume_famille/:id' => 'familles#resume_famille'
  end
end

