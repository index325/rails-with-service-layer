Rails.application.routes.draw do
  resources :user, only: [:create] do
    member do
      patch 'activate'
      patch 'deactivate'
      put 'add_permission'
      put 'remove_permission'
    end
  end
end
