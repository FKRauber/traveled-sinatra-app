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

end
