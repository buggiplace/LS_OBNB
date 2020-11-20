Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :offices do
    collection do
      get :corporate_index
    end
    collection do
      get :startup_index
    end
    collection do
      get :private_owner_index
    end
    resources(:bookings, {only: [:create, :show]})
  end
  resources(:bookings, {only: [:index, :destroy]}) do
    member do
      put :accept
      put :reject
    end
  end

  get "myobnb", to: 'users#host_index'
end




# Rails.application.routes.draw do
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#   root to: 'cocktails#index'
#   resources :cocktails, only: [:index, :show, :new, :create] do
#     resources :doses, only: [:create, :new]
#   end
#   resources :doses, only: [:destroy]
# end
