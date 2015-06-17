class CommentsController < ApplicationController
before_action do
  @city = City.find(params[:city_id])
  @property = Property.find(params[:property_id])
end

  def new
    @comment = @property.comments.new
  end

  def create
    @comment = @property.comments.new(comment_params.merge(city: @city, property: @property))
    if @comment.save
      flash[:notice] = "Your comment has been created"
      redirect_to city_property_path(@property)
    else
      render :new
      flash[:notice] = "Something went wrong"
    end
  end

  def edit
    @comment = @property.comments.find(params[:id])
  end

  def update
    @comment = @property.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "You have updated your comment"
      redirect_to city_property_path(@property)
    else
      render :new
      flash[:notice] = "Something went wrong"
    end
  end

  def delete
    @comment = @property.comments.find(params[:id])
    @comment.delete
    flash[:notice] = "You just deleted your comment"
    redirect_to "/"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :rating, :dates).merge(property_id: params[:property_id])
  end

end
