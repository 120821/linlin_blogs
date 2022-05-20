Rails.application.routes.draw do
  resources :blogs, only:[:index, :show] do
    collection do
      get :list
    end
  end

  resources :my_blogs
  resources :articals

  root :to => "blogs#index"

  resources :logins do
    collection do
      get :logout
    end
  end

  namespace :admin do
    resources :blogs do
      collection do
        #todo 写一个接口出来 post
        post '/blogs/upload_paste_image_to_cdn', to: 'blogs#upload_paste_image_to_cdn'
      end
    end

  end

end

