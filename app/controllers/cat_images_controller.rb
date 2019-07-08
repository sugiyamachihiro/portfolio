class CatImagesController < ApplicationController

	def destroy
	    @cat_image = CatImage.find(params[:id])
        @cat_image.destroy
		redirect_to edit_cat_path(id: params[:cat_id])
	end
end
