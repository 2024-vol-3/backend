Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check

  # /users
  resources :users ,only: [:index,:create,:show, :update, :destroy]

  # /groups
  resources :groups ,only: [:index,:create,:show, :update, :destroy]

  # /groups/[group_id]/issues
  resources :groups do
    resources :issues ,only: [:index,:create,:show, :update, :destroy]
  end



#/groups/[group_id]/issues/[issue_id]/tag 
  resources :groups ,only: [:index,:create,:show, :update, :destroy] do
    resources :issues ,only: [:index,:create,:show, :update, :destroy] do
      resources :tags ,only: [:index,:create,:show, :update, :destroy]
    end
  end


  resources :groups do
    resources :issues do
      resources :days ,only: [:index,:show,:create,:update, :destroy]
    end
  end
end
