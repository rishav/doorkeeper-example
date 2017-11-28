class Api::PostsController < ApplicationController

  before_filter :find_post, only: [:update, :destroy, :show]
  def index
    posts = current_user.posts
    render json: posts
  end

  def create
    post = current_user.posts.build(post_params)
    if post.save
      render json: @post
    else
      render json: { status: :not_created, errors: @post.errors }
    end
  end

  def show
    render json: @post
  end

  def update
    if @post.update_attributes(post_params)
      render json: @post
    else
      render json: { status: :not_updated, errors: @post.errors }
    end
  end

  def destroy
    @post.destroy
    render json: { status: :ok }
  end

  private

  def find_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:id, :title, :body)
  end

end
