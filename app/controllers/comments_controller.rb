class CommentsController < ApplicationController


  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params.merge(city: @city, property: @property))
    if @comment.save
      flash[:notice] = "Your comment has been created"
      redirect_to "/"
    else
      render :new
      flash[:notice] = "Something went wrong"
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "You have updated your comment"
      redirect_to "/"
    else
      render :new
      flash[:notice] = "Something went wrong"
    end
  end

  def delete
    @comment = Comment.find(params[:id])
    @comment.delete
    flash[:notice] = "You just deleted your comment"
    redirect_to "/"
  end

  private

  def property_params
    params.require(:comment).permit(:comment, :rating, dates)
  end

end
