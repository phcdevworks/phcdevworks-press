PhcdevworksPress::Engine.routes.draw do

    # Review Routes
    namespace :review, class_name: 'Review::Post' do
        resources :posts
    end

    # List Routes
    namespace :list do
        resources :posts, class_name: 'List::Post' do
            resources :items, class_name: 'List::Item'
        end
    end

    # Article Routes
    namespace :article do
        resources :posts, class_name: 'Articles::Post'
    end

    # Frontend Routes
    namespace :blog do
        resources :articles, only: [:index, :show]
        resources :lists, only: [:index, :show]
        resources :reviews, only: [:index, :show]
    end

    # API Routes
    namespace :api, :path => "", :constraints => {:subdomain => "api"} do
        namespace :v1 do
            resources :posts, defaults: {format: 'json'}
        end
    end

    # Mount Routes
    mount PhcdevworksAccounts::Engine, :at => '/'
    mount PhcdevworksAccountsStripe::Engine, :at => '/'
    mount PhcdevworksCoreModules::Engine, :at => '/'

end
