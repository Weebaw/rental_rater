class CommentsController < ApplicationController

  before_action :find_city, except: [:destroy]
  before_action :find_property, except: [:destroy]


  def new
    @comment = @property.comments.new
  end

  def create
    @comment = @property.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Your comment has been created"
      redirect_to city_property_path(@property.city, @property)
    else
      redirect_to city_property_path(@property.city, @property)
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
      render :properties => "show"
      flash[:notice] = "Something went wrong"
    end
  end

  def destroy

    @comment = Comment.find(params[:id])
    @comment.delete
    flash[:notice] = "You just deleted your comment"
    redirect_to "/"
  end

  private

  def find_city
    @city = City.find(params[:city_id])
  end

  def find_property
    @property = Property.find(params[:property_id])
  end

  def comment_params
    params.require(:comment).permit(:comment, :rating, :dates, :date_out).merge(property_id: params[:property_id], user_id: current_user.id)
  end
end
