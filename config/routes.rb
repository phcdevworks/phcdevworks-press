PhcdevworksPress::Engine.routes.draw do

  # Article Routes
  namespace :article do
    resources :posts, class_name: 'Articles::Post'
  end

  # Frontend Routes
  namespace :blog do
    resources :articles, only: [:index, :show]
  end

  # API Routes
  namespace :api, :path => "", :constraints => {:subdomain => "api"} do
    namespace :v1 do
      resources :posts, defaults: {format: 'json'}
    end
  end

  # Mount Routes
  mount PhcdevworksAccounts::Engine, :at => '/'
  mount PhcdevworksCoreModules::Engine, :at => '/'

end
