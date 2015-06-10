class PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:notice] = "#{@property.name} has been creaeted"
      redirect_to "/"
    else
      render :new
      flash[:notice] = "Something went wrong"
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(city_params)
      flash[:notice] = "You have updated #{@property}"
      redirect_to "/"
    else
      render :new
      flash[:notice] = "Something went wrong"
    end
  end

  def delete
    @property = Property.find(params[:id])
    @property.delete
    flash[:notice] = "You just deleted #{@property.name}"
    redirect_to "/"
  end

  private

  def property_params
    params.require(:property).permit(:name)
  end

end
