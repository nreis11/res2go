class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer  :user_id, presence: true
      t.integer  :reservoir_id, presence: true
      t.integer  :minimum_threshold
      t.integer  :maximum_threshold

      t.timestamps(null:false)
    end
  end
end
