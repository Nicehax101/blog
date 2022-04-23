# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'books', to: 'books#book_index'
      resources :authors, except: %i[new edit] do
        resources :books, except: %i[new edit]
      end
    end
  end
end
