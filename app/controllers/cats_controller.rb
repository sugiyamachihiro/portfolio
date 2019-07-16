class CatsController < ApplicationController
before_action :authenticate_user!

    def index
        @search = Cat.search(params[:q])
        @cats = @search.result
    end

    def show
        @cat = Cat.find(params[:id])
        @room = Room.new
    end

    def new
    	@cat = Cat.new
    	@cat_image = @cat.cat_images.build
    end

    def create
    	@user = current_user
    	@cat = Cat.new(cat_params)
    	@cat.user_id = current_user.id
        if @cat.save
            flash[:notice] = "里親の募集を開始しました"
            redirect_to  cat_path(@cat)
        else
            flash[:alert] = "投稿に失敗しました。"
            render :new
        end
    end

    def edit
        @cat = Cat.find(params[:id])
        if current_user.id != @cat.user.id
           redirect_to cat_path(@cat)
        end
    end

    def update
        @user = current_user
        @cat = Cat.find(params[:id])
        @cat.update(cat_params)
        redirect_to cat_path(@cat.id)
    end


    def destroy
        @cat = Cat.find(params[:id])
        @cat.destroy
        redirect_to user_path(current_user.id)
    end

  private

      def cat_params
            params.require(:cat).permit(:user_id, :title, :prefecture, :reason, :age, :age_detail, :sex, :kind, :condition, :spay_and_neuter, :vaccine, :remark, :individual_or_corporate, :cat_status, cat_images_images: [])
      end

end
