Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      
      controller :email do
        post 'email_teste' => :email_teste
      end
      resources :email
      
      controller :dica do
        get 'dicas' => :dicas
      end
      resources :dica
    
    end
  end
end
