class Reservoir < ActiveRecord::Base
  has_many :stats
  has_many :users, through: :stats

  validates :name, presence: true

  def percent_capacity
    (self.storage / self.capacity * 100).round(0)
  end

end
