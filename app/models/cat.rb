class Cat < ApplicationRecord

#論理削除
acts_as_paranoid

belongs_to :user
has_many :favorites, dependent: :destroy
has_many :favorite_users, through: :favorites, source: :user
def favorite?(cat, user)
 cat.favorites.find_by(user_id: user.id)
end
has_many :cat_images, inverse_of: :cat, dependent: :destroy
accepts_nested_attributes_for :cat_images,reject_if: :all_blank, allow_destroy: true
accepts_attachments_for :cat_images, attachment: :image, append: true

has_many :rooms


#validation記述
  validates :title,presence: true, length:{ in: 1..50 }
  validates :prefecture,presence: true
  validates :reason,presence: true, length:{ in: 1..2000 }
  validates :age,presence: true
  validates :age_detail,presence: true
  validates :sex,presence: true
  validates :kind,presence: true
  validates :condition,presence: true
  validates :spay_and_neuter,presence: true
  validates :vaccine,presence: true
  validates :individual_or_corporate,presence: true

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

enum sex: {オス:1,メス:2,不明:3}

enum age: {子猫:1,成猫:2,老猫:3}

enum kind: {雑種:1,アビシニアン:2,アメリカンカール:3,アメリカンショートヘア:4,アメリカンボブテイル:5,
            アメリカンワイヤーヘア:6,エキゾチックショートヘア:7,エジプシャンマウ:8,オシキャット:9,オリエンタルショートヘア:10,
            オリエンタルロングヘア:11,サイベリアン:12,ジャパニーズボブテイル:13,シャム:14,シャルトリュー:15,
            シンガプーラ:16,スコティッシュフォールド:17,スノーシュー:18,スフィンクス:19,セルカークレックス:20,
            ソマリ:21,ターキッシュアンゴラ:22,ターキッシュバン:23,デボンレックス:24,トンキニーズ:25,
            ノルウェージャンフォレストキャット:26,バーマン:27,バーミーズ:28,バリニーズ:29,ピクシーボブ:30,
            ピーターボールド:31,ヒマラヤン:32,ブリティッシュショートヘア:33,ブリティッシュロングヘア:34,ペルシャ:35,
            ベンガル:36,ボンベイ:37,マンクス:38,マンチカン:39,メインクーン:40,
            ヨーロピアンバーミーズ:41,ラガマフィン:42,ラグドール:43,ラパーマ:44,ロシアンブルー:45,
            三毛猫:46,ミヌエット:47,その他:48
            }

enum individual_or_corporate: {個人:1,法人:2}

enum cat_status: {募集中:0, 相談中:1, 募集終了:2}

enum spay_and_neuter: {未:1,済:2}

end