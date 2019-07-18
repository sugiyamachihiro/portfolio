class InquiryChatChannel < ApplicationCable::Channel

	def subscribed
	  stream_from "inquiry_chat_channel"
	end

	def unsubscribed
	end

	def speak(data)
	  ActionCable.server.broadcast 'inquiry_chat_channel', inquiry_message: data
	 inquiry_room = InquiryRoom.find(data['inquiry_room_id'])
	 inquiry_message = inquiry_room.inquiry_messages.build(adminflag:data['adminflag'],content:data['content'])
	 inquiry_message.save!


	end

end