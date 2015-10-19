class Micropost < ActiveRecord::Base
  belongs_to :user  #それぞれの投稿は特定の1人のユーザーのものである。
  validates :user_id, presence: true  #user_idが存在する
  validates :content, presence: true, length: {maximum: 140}  #contentが存在し、また文字数制限は最大140。
end