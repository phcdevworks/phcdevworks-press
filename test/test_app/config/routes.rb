Rails.application.routes.draw do

  # Root
  root :to => "website/pages#index"

  # Mount Engine
  mount PhcdevworksPress::Engine => "/"

end
