class Reservoir < ActiveRecord::Base
  has_many :users_reservoirs
  has_many :users, through: :users_reservoirs

  validates :name, presence: true

  def percent_capacity
    (self.storage / self.capacity).round(2)
  end

end
