class tripsController < ApplicationController

  get '/trips/index' do
    erb :'/trips/index'
  end

  get '/trips/show' do
    erb :'/trips/show'
  end

  get '/trips/new' do
    erb :'/trips/new'
  end

  get '/trips/edit' do
    erb :'/trips/edit'
  end

  delete '/trips/:id/delete' do
    @trip = trip.find_by_id(params[:id])
    @trip.delete
    redirect to '/trips/show'
  end

end
