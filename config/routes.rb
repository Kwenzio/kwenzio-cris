Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/emails" if Rails.env.development?

  get "up" => "rails/health#show", as: :rails_health_check
end
