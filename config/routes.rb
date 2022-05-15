Rails.application.routes.draw do
  resources :blogs do
    collection do
      get :list
    end
  end
  resources :my_blogs
  resources :logins do
    collection do
      get :logout
    end
  end

  resources :articals
  namespace :interface do
    resources :blogs do
     collection do
        get :all
      end
    end
  end

end

