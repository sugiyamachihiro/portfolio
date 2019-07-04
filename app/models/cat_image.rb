class CatImage < ApplicationRecord

belongs_to :cat
attachment :image

validates :image, presence: true

end