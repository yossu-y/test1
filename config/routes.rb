Rails.application.routes.draw do

  root to: 'homes#top'

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :customer do
    resource :customer, only:[:update, :edit] do
      get "/customers/:id/unsubscribe" => "customers#unsubscribe", as: "unsubscribe"
      patch "/customers/:id/withdrawal" => "customers#withdrawal", as: "withdrawal"
    end
  end
  
  
  

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
