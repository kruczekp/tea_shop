Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: -> (_) { [404, {}, []] }

  scope :v1, defaults: { format: :json } do
    resources :teas, only: [:index, :show]
    resources :popular_teas, only: :index
    resource :basket, only: [:show, :update, :destroy]
    resource :cart, only: [:update, :show]
    match '*path', via: :options, to: -> (_) { [204, {}, []] }
  end
end
