Rails.application.routes.draw do
  resources :game_masters do
    resources :campaigns, only: [:new, :edit, :create, :update, :destroy, :show] do 
      resources :episodes, only: [:new, :edit, :create, :update, :destroy, :show] 
    end
  end
  resources :campaigns, only:[:index] 
  resources :setting
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
