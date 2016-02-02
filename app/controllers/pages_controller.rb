class PagesController < ApplicationController
  def home
    @posts = Post.paginate(page: params[:page], per_page: 10)
  end
end
