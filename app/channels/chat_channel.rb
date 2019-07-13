class ChatChannel < ApplicationCable::Channel

	def subscribed
	  stream_from "chat_channel"
	end

	def unsubscribed
	end

	def speak(data)
	  ActionCable.server.broadcast 'chat_channel', message: data
	  from_user = User.find_by(id: data['from_id'].to_s)
	  from_user.send_message(data['room_id'], data['content'])
	end

end