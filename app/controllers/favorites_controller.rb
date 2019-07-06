class FavoritesController < ApplicationController
	before_action :authenticate_user!

 def create
  @cat = Cat.find(params[:cat_id])
  @favorite = current_user.favorites.create(cat_id: params[:cat_id])
  render 'create.js.erb'
 end

 def destroy
  @cat = Cat.find(params[:cat_id])
  @favorite = current_user.favorites.find_by(cat_id: params[:cat_id]).destroy
  render 'destroy.js.erb'
 end

end