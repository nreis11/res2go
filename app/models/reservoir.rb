class Reservoir < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true

  def percent_capacity
    (self.storage / self.capacity).round(2)
  end

end
