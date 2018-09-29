class UsersController < ApplicationController
  get 'users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end

  # /SIGNUP
  get '/signup' do
    if !logged_in?
      erb :'/users/new', locals: {message: "Please Sign Up before you Sign In"}
    else
      redirect to '/show'
    end
  end
  post '/signup' do

  end

  # /LOGIN
  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/show'
    end
  end
  post '/login' do

  end

  # LOGOUT
  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
