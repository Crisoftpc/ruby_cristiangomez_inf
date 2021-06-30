Rails.application.routes.draw do
  resources :documentos
  resources :todos
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  get "/todosx", to: "todos#todosx"
  post "Metodo2", to: "documentos#guardardoc"
  post "Metodo3", to: "documentos#consultacola"
  get "/Descargar/:id", to: "documentos#show"
  #post "nuevo", to: "documentos#nuevodoc"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
