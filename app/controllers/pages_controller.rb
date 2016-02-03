class PagesController < ApplicationController
  def home
    @posts = Post.paginate(page: params[:page], per_page: 10)
    redirect_to posts_path if logged_in?
  end
end
