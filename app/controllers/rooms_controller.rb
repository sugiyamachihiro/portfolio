class RoomsController < ApplicationController

	def show
		@room = Room.find(params[:id])
		@user = current_user
		@messages = Message.recent_in_room(@room_id)
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
