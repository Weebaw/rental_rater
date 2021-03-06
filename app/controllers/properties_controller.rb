class PropertiesController < ApplicationController
  before_action do
    @city = City.find(params[:city_id])

  end

  def index
    @properties = @city.properties.all
    respond_to do |format|
      format.json { render json: @properties.to_json }
      format.html { @properties }
    end
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params.merge(city: @city))
    if @property.save

      #generate property map --> address must get passed to the map



      flash[:notice] = "#{@property.address}, #{@property.city_name}, CO has been created"
      redirect_to city_properties_path(@city)
    else
      render :new
      flash[:notice] = "Something went wrong"
    end
  end

  def show
    @property = Property.find(params[:id])
    @comment = Comment.new
    # @comments = @property.comments
    respond_to do |format|
      format.json{ render json: @property.to_json }
      format.html { @property}
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      flash[:notice] = "You have updated #{@property.address}"
      redirect_to "/"
    else
      render :new
      flash[:notice] = "Something went wrong"
    end
  end

  def delete
    @property = Property.find(params[:id])
    @property.delete
    flash[:notice] = "You just deleted #{@property.address}"
    redirect_to "/"
  end

  private

  def property_params
    params.require(:property).permit(:address, :building_type, :building_name, :apt_number, :city_name, :landlord, :rating_total, :logitude, :latitude)
  end

  def comment_params
 params.require(:comment).permit(:comment, :rating, :dates, :date_out).merge(property_id: params[:property_id], user_id: current_user.id)
  end

end
