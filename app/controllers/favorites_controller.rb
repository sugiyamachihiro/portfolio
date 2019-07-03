class FavoritesController < ApplicationController

def create
    cat = Cat.find(params[:cat_id])
    favorite = current_user.favorites.new(cat_id: cat.id)
    favorite.save
    redirect_to cat_path(cat)
end
def destroy
    cat = Cat.find(params[:cat_id])
    favorite = current_user.favorites.find_by(cat_id: cat.id)
    favorite.destroy
    redirect_to cat_path(cat)
end

end
