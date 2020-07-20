Spree::Core::Engine.add_routes do
  resources :producers, only: [:index, :show]

  namespace :admin do
    resources :producers do
      collection do
        post :update_positions
      end
    end
  end
end



