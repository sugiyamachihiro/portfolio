class InquiryChatChannel < ApplicationCable::Channel

	def subscribed
	  stream_from "inquiry_chat_channel"
	end

	def unsubscribed
	end

	def speak(data)
	  ActionCable.server.broadcast 'inquiry_chat_channel', inquiry_message: data
	  if data['adminflag'].to_i == 0
		from_user = User.find_by(id: data['from_id'].to_s)
  	  else
		from_user = Admin.find_by(id: data['from_id'].to_s)
	  end
	  from_user.send_inquiry_message(data['inquiry_room_id'],data['adminflag'], data['content'])

	end

end