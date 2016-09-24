class ImagePostsController < ApplicationController
    
    def new 
        @image_post = ImagePost.new
    end
    
    def create 
        @image_post = ImagePost.new(image_post_params)
        if @image_post.save
            redirect_to @image_post 
        else
            render 'new'
        end
    end
    
    private
    
    def image_post_params
        params.require(:image_post).permit(:url)
    end
end
