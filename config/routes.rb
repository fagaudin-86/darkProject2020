Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #Routage à la page principal au moment du lancement de l'application
  root :to =>'root#redirection_principal'

  resources :application do
    collection do
      get 'principal'
      get 'resume'
      post 'resume_famille' => 'application#resume_famille'
    end
    member  do
      post 'create_parent' => 'application#create_parent'
      post 'create_enfant' => 'application#create_enfant'
      post 'get_familly'  => 'application#get_familly'
      #post 'resume_famille/:id' => 'application#resume_famille'
    end
  end

end

