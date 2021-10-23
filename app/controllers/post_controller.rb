class PostController < ApplicationController
  def index
    @posts = Post.all.where(:published => true).order(:created_at => :desc)
  end
  
  def show
    slug_param = params[:slug]
    @post = Post.find_by(slug: slug_param, :published => true)

    if @post.nil?
      redirect_to action: "pages#not_found"
    end
  end

  def not_found
    head 404
  end
end
