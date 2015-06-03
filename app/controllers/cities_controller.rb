class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = city.new(city_params)
      if @city.save
        flash[:notice] = "#{@city.name} has been creaeted"
        redirect_to "/"
      else
        render :new
        flash[:notice] = "Something went wrong"
      end
  end

  def show
    @city = City.find(params[:id])
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
      if @city.update(city_params)
        flash[:notice] = "You have updated #{@city}"
        redirect_to "/"
      else
        render :new
        flash[:notice] = "Something went wrong"
      end
  end

  def delete
    @city = City.find(params[:id])
    @city.delete
    flash[:notice] = "You just deleted #{@city.name}"
    redirect_to "/"
  end
  
end