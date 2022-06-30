Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :blogs do
    collection do
      get :list
    end
  end

  resources :my_blogs do
    collection do
      get :test
    end
  end
  resources :categories do
    collection do
    end
  end
  resources :articals
  resources :users

  root :to => "blogs#index"

  resources :logins do
    collection do
      get :logout
    end
  end

  resources :buckets do
    resources :objects
  end

  namespace :admin do
    resources :blogs do
      collection do
        post '/blogs/upload_paste_image_to_cdn', to: 'blogs#upload_paste_image_to_cdn'
      end
    end

  end

end

