class User < ActiveRecord::Base

  has_and_belongs_to_many :goals
  has_and_belongs_to_many :awards

end
