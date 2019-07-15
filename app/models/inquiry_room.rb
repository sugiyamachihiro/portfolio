class InquiryRoom < ApplicationRecord

belongs_to :user
has_many :inquiry_messages

end