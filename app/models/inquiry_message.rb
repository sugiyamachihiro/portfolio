class InquiryMessage < ApplicationRecord

	belongs_to :inquiry_room

	# Scopes
	default_scope -> {order(created_at: :asc)}

	# Validations
	validates :inquiry_room_id, presence: true
	validates :content, presence: true, length: {maximum: 500}
	validates :adminflag, presence: true

	# Callbacks
	after_create_commit { InquiryMessageBroadcastJob.perform_later self }

	# Methods
	def Message.recent_in_inquiry_room(inquiry_room_id)
	  where(inquiry_room_id: inquiry_room_id).last(500)
	end

end