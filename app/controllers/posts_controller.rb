class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @posts = Post.paginate(page: params[:page], per_page: 3)
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = "Your post was succesfully created!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Your post was updated succesfully!"
      redirect_to posts_path(@post)
    else
      render :edit
    end
  end

  def destroy
    Post.find(find[:id]).destroy
    flash[:success] = "Post Deleted"
    redirect_to posts_path
  end

    private

      def post_params
        params.require(:post).permit(:title, :description, :picture, topic_ids: [])
      end

      def set_post
        @post = Post.find(params[:id])
      end

      def require_same_user
        if current_user != @post.user
          flash[:danger] = "you can only edit your own posts."
          redirect_to posts_path
        end
      end

      def admin_user
        redirect_to posts_path unless current_user.admin?
      end

    end
