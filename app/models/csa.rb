class Csa < ActiveRecord::Base
  belongs_to :manager, :class_name => 'User'
  
  has_many :offerings
  has_many :shares, :through => :offerings
  
  has_many :users, :through => :shares
  
  def to_s
    name
  end
end
