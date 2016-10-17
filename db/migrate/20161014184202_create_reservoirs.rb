class CreateReservoirs < ActiveRecord::Migration
  def change
    create_table :reservoirs do |t|
      t.string   :name
      t.integer  :storage
      t.integer  :capacity

      t.timestamps(null: false)
    end
  end
end
