Rails.application.routes.draw do
  get '/students/:id', to: 'students#show'

  get '/courses/:id', to: 'courses#show'
end
