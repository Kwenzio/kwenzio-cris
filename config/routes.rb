Rails.application.routes.draw do
  # Email
  mount LetterOpenerWeb::Engine, at: "/emails" if Rails.env.development?

  # Authentication
  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  # Password Reset
  resource :passwords, path: "reset-password",
      param: :token, path_names: { new: "" },
      only: %i[ new create edit update ]

  get "up" => "rails/health#show", as: :rails_health_check
end
