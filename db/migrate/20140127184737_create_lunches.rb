class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name
      t.float :price
      t.string :website, :default => "http://placekitten.com/200/200"
      t.boolean :taken, :default => false

      t.timestamps
    end
  end
end
