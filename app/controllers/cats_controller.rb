class CatsController < ApplicationController

	def index
	end

    def new
    	@cat = Cat.new
    end

    def create
    	@cat = Cat.new(cat_params)
    end



  private

    def cat_params
        params.require(:cat).permit(:user_id, :title, :prefecture, :reason, :age, :age_detail, :sex, :kind, :condition, :vaccine, :remark, :individual_corporate, :cat_status)
    end

end
