class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :inquiry_room
    has_many :from_inquiry_messages, class_name: "InquiryMessage",
              foreign_key: "from_id", dependent: :destroy
    has_many :sent_inquiry_messages, through: :from_inquiry_messages, source: :from

    # Send message to other user
    def send_inquiry_message(inquiry_room_id, adminflag, content)
      from_inquiry_messages.create!(inquiry_room_id: inquiry_room_id, content: content, adminflag: adminflag)
    end

end