class InquiryRoomsController < ApplicationController

	def show
		if user_signed_in?
			@inquiry_room = InquiryRoom.find(params[:id])
	        @messages = InquiryMessage.where(inquiry_room_id: @inquiry_room.id)
        elsif admin_signed_in?
	        @inquiry_room = InquiryRoom.find(params[:id])
	        @messages = InquiryMessage.where(inquiry_room_id: @inquiry_room.id)
        else
            redirect_to root_path
        end
	end

  	def create
  		if InquiryRoom.exists?(user_id: current_user.id)
  			@inquiry_room = InquiryRoom.find_by(user_id: current_user.id)
			redirect_to user_inquiry_room_path(current_user.id, @inquiry_room)
		else
			@inquiry_room = InquiryRoom.new(user_id: current_user.id)
			@inquiry_room.save
			redirect_to user_inquiry_room_path(current_user.id, @inquiry_room)
		end
	end

	private

end