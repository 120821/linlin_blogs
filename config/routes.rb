Rails.application.routes.draw do
  resources :blogs do
    collection do
      get :list
    end
  end
  resources :my_blogs

  namespace :interface do
    resources :blogs do
     collection do
        get :all
      end
    end
  end

end

