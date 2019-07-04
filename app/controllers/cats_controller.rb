class CatsController < ApplicationController

    def index
        @search = Cat.search(params[:q])
        @cats = @search.result
    end

    def show
        @cat = Cat.find(params[:id])
    end

    def new
    	@cat = Cat.new
    	@cat_image = @cat.cat_images.build
    end

    def create
    	@user = current_user
        p "---------------------------------"
        p cat_params
        p params
        p "---------------------------------"
    	@cat = Cat.new(cat_params)
    	@cat.user_id = current_user.id
        @cat.save
        redirect_to  cat_path(@cat), notice: '里親の募集を開始しました'
    end

    def edit
    end

    def destroy
    end

  private

    def cat_params
        params.require(:cat).permit(:user_id, :title, :prefecture, :reason, :age, :age_detail, :sex, :kind, :condition, :spay_and_neuter, :vaccine, :remark, :individual_or_corporate, :cat_status, cat_images_images: [])
    end

end
