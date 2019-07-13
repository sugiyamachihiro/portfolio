require 'happybirthday'
class EighteenValidator < ActiveModel::EachValidator
def validate_each(record, attribute, value) # バリデーションメソッド
    year_old = Happybirthday.born_on(value.year.to_s + '/' + value.month.to_s + '/' + value.day.to_s).age.years_old
    p year_old
    if year_old.to_i < 18
        record.errors.add(attribute, "18歳未満は登録できません")
    end
end
end
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#validate :over_eightteen
devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

attachment :image

#論理削除
acts_as_paranoid

has_many :cats
has_many :favorites, dependent: :destroy
has_many :favorite_cats, through: :favorites, source: :cat

#chat関連記述
has_many :rooms
has_many :from_messages, class_name: "Message",
          foreign_key: "from_id", dependent: :destroy
has_many :to_messages, class_name: "Message",
          foreign_key: "to_id", dependent: :destroy
has_many :sent_messages, through: :from_messages, source: :from
has_many :received_messages, through: :to_messages, source: :to

# Send message to other user
def send_message(room_id, content)
  from_messages.create!(room_id: room_id, content: content)
end

#validation記述
  validates :nick_name,presence: true, length:{ in: 1..50 }
  validates :user_name,presence: true, length:{ in: 1..50 }
  validates :sex,presence: true
  validates :birthday,presence: true,eighteen: true
  validates :postalcode,presence: true, length:{is:7},format:{with:/\A[0-9]+\z/ ,message:'は数字で入力してください。'}
  validates :prefecture,presence: true
  validates :address,presence: true
  validates :telephone_number,presence: true,length:{ in: 9..20 },format:{with:/\A[0-9]+\z/ ,message:'は数字で入力してください。'}


#enum記述
enum prefecture: {
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }

enum sex: {
    男:1,女:2
  }

  acts_as_paranoid

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
