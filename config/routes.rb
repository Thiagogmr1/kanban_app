Rails.application.routes.draw do
  resources :boards do
    resources :lists do
      resources :cards
    end
  end
end