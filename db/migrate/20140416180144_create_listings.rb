class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.column :price, :decimal, :precision => 10, :scale => 2
      t.string :location
      t.integer :bedrooms
      t.integer :bathrooms
      t.text :description
      t.belongs_to :user
      t.timestamps
    end
  end
end
