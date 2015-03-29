Rails.application.routes.draw do
  root "welcome#index"
  resources :urls
  get "/:short_url" => "urls#redirect", as: "short_url_redirect"
end
