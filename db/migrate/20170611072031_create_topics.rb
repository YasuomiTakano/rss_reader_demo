class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.text :title
      t.text :link
      t.datetime :pub_date

      t.timestamps
    end
  end
end
