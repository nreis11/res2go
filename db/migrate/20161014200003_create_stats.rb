class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer  :user_id
      t.integer  :reservoir_id
      t.integer  :floor_capacity
      t.integer  :ceiling_capacity
    end
  end
end
