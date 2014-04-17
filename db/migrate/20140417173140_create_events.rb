class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :renter_id
      t.belongs_to :listing
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
