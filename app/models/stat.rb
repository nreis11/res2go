class Stat < ActiveRecord::Base
  belongs_to :user
  belongs_to :reservoir
end
