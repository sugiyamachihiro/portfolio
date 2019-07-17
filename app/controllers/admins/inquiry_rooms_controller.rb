class Admins::InquiryRoomsController < ApplicationController

	def index
		@inquiry_room = InquiryRoom.unscoped.all
		@inquiry_rooms = @inquiry_room.page(params[:page]).per(20)
	end

	def inquiry_room_params
		params.require(:inquiry_room).permit(:user_id, :content, :adminflag)
	end

end