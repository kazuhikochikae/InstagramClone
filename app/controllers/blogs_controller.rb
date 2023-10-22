class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end
  
  def show
    @blog = Blog.find(params[:id])
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id

    if @blog.save
      # Send an email using Action Mailer
      ContactMailer.contact_mail(@blog).deliver
      redirect_to blogs_path, notice: 'ブログを作成しました！'
    else
      render :new
    end
  end


  def edit
    @blog = Blog.find(params[:id])
    unless @blog.user == current_user
      redirect_to  new_post_path
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.user != current_user
      redirect_to blogs_path
  else
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: 'ブログを編集しました！'
    else
      render :edit
    end
  end
end

def destroy
  @blog = Blog.find(params[:id])

  if @blog.user != current_user
    redirect_to blogs_path
  else
    @blog.destroy
    redirect_to blogs_path, notice: 'ブログを削除しました！'
  end
end

  def confirm
    @blog = Blog.new(blog_params)
   
  end


  
  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:img, :content, :img_cache)
  end

end
