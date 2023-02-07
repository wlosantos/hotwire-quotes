Rails.application.routes.draw do
  mount Lookbook::Engine, at: '/lookbook' if Rails.env.development?
  devise_for :users

  resources :quotes do
    resources :line_item_dates, except: %i[index show]
  end

  root 'pages#home'
end
