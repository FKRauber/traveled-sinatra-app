class UsersController < ApplicationController
  get 'users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'/users/show'
  end

  # /SIGNUP
  get '/signup' do
    if !logged_in?
      erb :'/users/signup', locals: {message: "Please Sign Up before you Sign In"}
    else
      redirect to '/users/show'
    end
  end
  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/users/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/users/show'
    end
  end

  # /LOGIN
  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to 'users/show'
    end
  end
  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/users/show'
    else
      redirect to '/users/signup'
    end
  end

  # LOGOUT
  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/users/login'
    else
      redirect to '/'
    end
  end
end
