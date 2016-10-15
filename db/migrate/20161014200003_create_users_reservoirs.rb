class CreateUsersReservoirs < ActiveRecord::Migration
  def change
    create_table :users_reservoirs do |t|
      t.integer  :user_id
      t.integer  :reservoir_id
    end
  end
end
