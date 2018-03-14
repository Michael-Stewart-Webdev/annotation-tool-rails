Rails.application.routes.draw do


  get 'welcome/index'

  root "welcome#index"
  match "/setup-project", to: "welcome#setup_project", via: "get"
  match "/upload-tokenized", to: "welcome#upload_tokenized", via: "post"
  match "/upload-untokenized", to: "welcome#upload_untokenized", via: "post"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
