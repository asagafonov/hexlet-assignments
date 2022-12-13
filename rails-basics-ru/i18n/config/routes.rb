# frozen_string_literal: true

Rails.application.routes.draw do
  # BEGIN
  scope ('/:locale'), locale: /en|ru/ do
    root 'home#index'
    resources :posts do
      scope module: :posts do
        resources :comments, only: %i[edit create update destroy]
      end
    end
  end

  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root
  # END

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
