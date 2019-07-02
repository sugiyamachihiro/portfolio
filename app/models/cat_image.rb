class CatImage < ApplicationRecord

belongs_to :cat
attachment :image
end