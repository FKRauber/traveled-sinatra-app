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
    @trip = Trip.find(params[:id])
    erb :'/trips/edit'
  end


  post '/trips/index' do
    if !logged_in?
      redirect '/'
    else
      Trip.create(params)
      redirect '/trips/index'
    end
  end


  patch '/trips/:id' do
    if !logged_in?
      redirect '/'
    else
      @trip = Trip.find(params[:id])
      @trip.update(name: params[:name], year_visited: params[:year_visited])
      redirect "/trips/#{params[:id]}"
    end
  end



  delete '/trips/:id/delete' do
    @trip = trip.find_by_id(params[:id])
    @trip.delete
    redirect to '/trips/show'
  end

end
