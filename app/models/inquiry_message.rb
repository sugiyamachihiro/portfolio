class InquiryMessage < ApplicationRecord

	belongs_to :from, class_name: "User"
	belongs_to :from, class_name: "Admin"
	belongs_to :inquiry_room

	# Scopes
	default_scope -> {order(created_at: :asc)}

	# Validations
	validates :from_id, presence: true
	validates :inquiry_room_id, presence: true
	validates :content, presence: true, length: {maximum: 500}

	# Callbacks
	after_create_commit { InquiryMessageBroadcastJob.perform_later self }

	# Methods
	def Message.recent_in_inquiry_room(inquiry_room_id)
	  where(inquiry_room_id: inquiry_room_id).last(500)
	end


end