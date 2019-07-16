class Admins::CatsController < ApplicationController
  def index
  	@cat = Cat.unscoped.all
    @cats = @cat.page(params[:page]).per(20)
  end

  def show
  end
end
