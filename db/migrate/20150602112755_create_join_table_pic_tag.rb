class CreateJoinTablePicTag < ActiveRecord::Migration
  def change
    create_join_table :pics, :tags do |t|
      # t.index [:pic_id, :tag_id]
      # t.index [:tag_id, :pic_id]
    end
  end
end
