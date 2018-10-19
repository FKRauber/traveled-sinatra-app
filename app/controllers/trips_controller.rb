class TripsController < ApplicationController

  get '/trips/index' do       # loads trips/index page - All Public Trips
    if !logged_in?
      redirect '/'
    else
      @trips = Trip.all
      erb :'/trips/index'
    end
  end

  get '/trips/new' do         # loads new form
    erb :'/trips/new'
  end

  get '/trips/:id' do         # loads trips/show page
    if !logged_in?
      redirect '/'
    else
      @trips = Trip.find(params[:id])
      erb :'/trips/show'
    end
  end

  get '/trips/:id/edit' do            # loads edit form
    @trip = Trip.find(params[:id])
    erb :'/trips/edit'
  end



  patch '/trips/:id' do          # updates a trip
    if !logged_in?
      redirect '/'
    else
      @trip = Trip.find(params[:id])
      if current_user.id == @trip.user_id
        @trip.update(name: params[:name], year_visited: params[:year_visited])
        redirect "/trips/#{@trip.id}"
      else
        "You cannot do that"
        redirect "trips/#{@trip.id}"
      end
    end
  end

  post "/trips/index" do        # creates a trip
    if !logged_in?
      redirect '/'
    else
      Trip.create(params)
      redirect to "/trips/index"
    end
  end



  delete '/trips/:id/delete' do     # deletes a trip
    @trip = Trip.find(params[:id])
    @trip.delete
    redirect to '/trips/index'
  end

end
