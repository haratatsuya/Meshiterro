class PostImagesController < ApplicationController
  def new
     @post_image = post_image.new
  end
  
   # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end
  
   def destroy
    post_image = PostIma.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
   end

  def index
    @post_images = PostImage.page(params[:page])
  end

  def show
    @post_images = post_images.find(params[:id])
  end
  
  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
