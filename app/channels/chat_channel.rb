class ChatChannel < ApplicationCable::Channel

	def subscribed
	  stream_from "chat_channel"
	end

	def unsubscribed
	end

	def speak(data)
	  #message = Massage.new
	  ActionCable.server.broadcast 'chat_channel', message: data
	  from_user = User.find_by(id: data['from_id'].to_s)
	  to_user = User.find_by(id: data['to_id'].to_s)
	  from_user.send_message(to_user, data['room_id'], data['content'])
	  #message.from_user = from_user
	  #message.to_user = to_user
	  #message.room_id = data['room_id']
	  #message.save
	end

end