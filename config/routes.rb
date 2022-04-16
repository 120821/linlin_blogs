Rails.application.routes.draw do resources :blogs do
    collection do
      get :list
    end
  end

  namespace :interface do
    resources :blogs do
     collection do
        get :all
      end
    end
  end

end

