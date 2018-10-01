class LocationsController < ApplicationController

  get '/index' do
    @location = Location.all
    erb :'/locations/index'
  end

  get '/show' do
    erb :'/locations/show'
  end

  get '/new' do
    erb :'/locations/new'
  end

  get '/edit' do
    erb :'/locations/edit'
  end

  delete '/locations/:id/delete' do
    @location = Location.find_by_id(params[:id])
    @location.delete
    redirect to '/locations/show'
  end

end
