class CreateReservoirs < ActiveRecord::Migration
  def change
    create_table :reservoirs do |t|
      t.string   :name
      t.float    :storage
      t.float    :capacity

      t.timestamps
    end
  end
end
