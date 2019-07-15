class InquiryRoomsController < ApplicationController

	def show
		@inquiry_room = InquiryRoom.find(params[:id])
        @messages = InquiryMessage.all
	end

  	def create
  		if InquiryRoom.exists?(user_id: current_user.id)
  			@inquiry_room = InquiryRoom.find_by(user_id: current_user.id)
			redirect_to user_inquiry_room_path(current_user.id, @inquiry_room)
		else
			@inquiry_room = InquiryRoom.new(user_id: current_user.id)
			@inquiry_room.save
			redirect_to user_inquiry_room_path(@inquiry_room.id)
		end
	end

	private

end
