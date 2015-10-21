class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      #ユーザーと投稿の関連付け  references=>関連付け 
      t.references :user, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end