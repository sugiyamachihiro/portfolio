class CatImage < ApplicationRecord

attachment :image

belongs_to :cat

validates :image, presence: true
validate :check_number_of_cat_images

def check_number_of_cat_images
	if cat && cat.cat_images.count > 5
	errors.add(:cat, "画像枚数は５枚までです")
	end
end

end