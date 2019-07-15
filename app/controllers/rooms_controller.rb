class RoomsController < ApplicationController

	def show
		@room = Room.find(params[:id])
		@messages = Message.where(room_id: @room.id)
		if current_user.id == @room.cat.user.id
		elsif current_user.id == @room.user.id
		else
           redirect_to user_path(@user.id)
        end
	end

	def create
		current_room(params[:room][:cat_id])
		@user = current_user
		@room.user_id = current_user.id
		@room.save
		redirect_to room_path(@room)
	end

	private

	  def room_params
	        params.require(:room).permit(:user_id, :cat_id)
	  end

end
