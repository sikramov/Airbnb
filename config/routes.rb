Rails.application.routes.draw do
  # get 'rooms/index'
  #
  # get 'rooms/show'
  #
  # get 'rooms/new'
  #
  # get 'rooms/create'
  #
  # get 'rooms/edit'
  #
  # get 'rooms/update'
  #
  root 'pages#home'
  devise_for :users,
      :path => '',
      :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
      :controllers => {:omniauth_callbacks => 'omniauth_callbacks',
                    :registrations => 'registrations'}

  resources :users, only: [:show]
  resources :rooms
  resources :photos
  resources :rooms do
      resources :reservations, only: [:create]
  end

  get '/preload' => "reservations#preload"
  get '/your_trips' => "reservations#your_trips"
end
