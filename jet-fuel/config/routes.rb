Rails.application.routes.draw do
  root "welcome#index"
  resources :urls
  get "/:short_url" => "urls#redirect", as: "short_url_redirect"

  namespace :api do
    namespace :v1 do
      root "welcome#index"
      resources :urls
      get "/:short_url" => "urls#redirect", as: "short_url_redirect"
    end
  end
end
