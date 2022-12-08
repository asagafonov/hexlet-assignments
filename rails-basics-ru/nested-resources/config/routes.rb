# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  # BEGIN
  scope module: :web do
    resources :posts, only: [:index]

    resources :posts, except: [:index] do
      resources :comments, only: %i[index new create]
    end

    resources :posts, except: [:index], shallow: true do
      resources :comments, only: %i[show edit update destroy]
    end
  end
  # END
end
