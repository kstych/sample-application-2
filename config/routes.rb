require 'sidekiq/web'
Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'

  get "enqueue-jobs/:jobs", to: "application#enqueue_jobs"
  get "enqueue-cpucrasherjobs/:jobs", to: "application#enqueue_cpucrasherjobs"
end
