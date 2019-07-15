class Admins::InquiryRoomsController < ApplicationController

	def index
		@inquiry_room = InquiryRoom.find_by(params[:id])
		@inquiry_rooms = InquiryRoom.all
	end

	def inquiry_room_params
		params.require(:inquiry_room).permit(:user_id, :content, :adminflag)
	end

end