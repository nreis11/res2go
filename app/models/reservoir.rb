class Reservoir < ActiveRecord::Base
  belongs_to :user

  def percent_capacity
    (self.storage / self.capacity).round(2)
  end

end
