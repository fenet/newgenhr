class BlogsController < ApplicationController
  before_action :authenticate_admin!, except: [:index]
  before_action :find_blog, only: [:edit, :update, :delete]
 
  def new
    @blog = current_admin.blogs.build
  end

  def create
     @blog = current_admin.blogs.build(blog_params)
      if @blog.save
        flash[:notice] = "Blog posted. Good Job!"
        redirect_to blogs_path
      else 
        render :new
     end
  end

  def index
    @blogs = Blog.order('created_at DESC')
    @blogs = Blog.paginate(:page => params[:page], :per_page => 9).order('created_at DESC')
  end

  def edit
  end

  def update
    if @blog.update_attributes(blog_params)
      flash[:notice] = "Successfully Blog Is Updated!!"
      redirect_to blogs_path
     else
      render :edit 
   end
  end

  def delete
  end

  def destroy
    blog = Blog.find(params[:id]).destroy
    flash[:notice] = "Blog Deleted!!"
    redirect_to blogs_path
  end

  def blog_params
    params.require(:blog).permit(:blog_photo, :blog)
  end 

  def find_blog
    @blog = Blog.find(params[:id])
  end

end
