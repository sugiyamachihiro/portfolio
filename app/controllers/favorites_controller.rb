class FavoritesController < ApplicationController

 def create
  @cat = Cat.find(params[:cat_id])
  @favorite = current_user.favorites.create(cat_id: params[:cat_id])
  render 'index.js.erb'
 end

 def destroy
  @cat = Cat.find(params[:id])
  @favorite = current_user.favorites.find_by(cat_id: params[:cat_id]).destroy
  render 'index.js.erb'
 end

end