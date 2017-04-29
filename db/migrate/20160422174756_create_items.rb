class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.integer :seller_id
      t.integer :broker_id

      t.timestamps null: false
    end
  end
end
