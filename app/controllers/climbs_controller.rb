class ClimbsController < ApplicationController

  def index
    # if client_has_valid_token?
    @climbs = Climb.all
    render json: @climbs
    # else
      # render json: {go_away: true}, status: :unauthorized
    # end
  end

  def show
     @climb = Climb.find(params[:id])
     render json: @climb
  end

  def new
     @climb = Climb.new
  end

  def create
     @climb = Climb.new(climb_params)

     if @climb.save
        redirect_to :action => 'list'
     else
        @subjects = Subject.all
        render :action => 'new'
     end
  end

  def edit
     @climb = Climb.find(params[:id])
     @subjects = Subject.all
  end

  def update
     @climb = Climb.find(params[:id])

     if @climb.update_attributes(book_param)
        redirect_to :action => 'show', :id => @climb
     else
        @subjects = Subject.all
        render :action => 'edit'
     end
  end

  private
  def climb_params
     params.require(:climbs).permit(:route, :location, :url, :avgstars, :yourstars, :routetype, :rating, :pitches, :length, :latitude, :longitude)
  end
end
