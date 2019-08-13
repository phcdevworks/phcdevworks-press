Rails.application.routes.draw do

    # Root
    root :to => 'website/pages#index'

    # Mount Engine
    mount PhcdevworksCmsPress::Engine => "/phcdevworks_cms_press"

end
