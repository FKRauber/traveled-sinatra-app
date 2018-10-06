class LocationsController < ApplicationController

  get '/locations/index' do
    erb :'/locations/index'
  end

  get '/locations/show' do
    erb :'/locations/show'
  end

  get '/locations/new' do
    erb :'/locations/new'
  end

  get '/locations/edit' do
    erb :'/locations/edit'
  end

  delete '/locations/:id/delete' do
    @location = Location.find_by_id(params[:id])
    @location.delete
    redirect to '/locations/show'
  end

end
