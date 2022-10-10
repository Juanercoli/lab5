Rails.application.routes.draw do
  resources :monsters, only: [:index, :new, :create, :update, :edit]

  root "monsters#index"
end
