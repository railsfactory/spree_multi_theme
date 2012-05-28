Rails.application.routes.draw do
  namespace :admin do
  resources :themes
  end
end
