Rails.application.routes.draw do
  resources :boards do
    resources :lists do
      resources :cards do
        patch :move, on: :member
      end
    end
  end
end