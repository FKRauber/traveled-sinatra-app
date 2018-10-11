class TripsController < ApplicationController

  get '/trips/index' do
    if !logged_in?
      redirect '/'
    else
      @trips = Trip.all
      erb :'/trips/index'
    end
  end

  get '/trips/new' do
    erb :'/trips/new'
  end

  get '/trips/:id' do
    if !logged_in?
      redirect '/'
    else
      @trips = Trip.find(params[:id])
      erb :'/trips/show'
    end
  end

  get '/trips/:id/edit' do
    @trips = Trip.find(params[:id])
    erb :'/trips/edit'
  end


  post '/trips/index' do
    if !logged_in?
      redirect '/'
    else
      @trips = Trip.create(params)
      redirect '/trips/index'
    end
  end


  patch '/trips/:id/edit' do
    if !logged_in?
      redirect '/'
    else
      erb :'/trips/:id'
    end
  end



  delete '/trips/:id/delete' do
    @trip = trip.find_by_id(params[:id])
    @trip.delete
    redirect to '/trips/show'
  end

end
