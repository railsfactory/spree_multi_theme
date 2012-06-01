Rails.application.routes.draw do
  namespace :admin do
  resources :themes , :only => [:new,:create]
  end
end
