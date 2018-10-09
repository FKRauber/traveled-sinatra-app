class UsersController < ApplicationController
  get 'users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/show'
  end

  # /SIGNUP
  get '/signup' do
    if !logged_in?
      erb :'/users/signup', locals: {message: "Please Sign Up before you Sign In"}
    else
      redirect to '/show'
    end
  end
  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/show'
    end
  end

  # /LOGIN
  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect '/show'
    end
  end
  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/show'
    else
      redirect to '/signup'
    end
  end

  # SHOW USER
  get '/show' do
    if !logged_in?
      # public trips
      redirect '/trips/index'
    else
      # personal trips
      erb :'/users/show'
    end
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
