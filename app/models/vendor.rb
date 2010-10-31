class Vendor < ActiveRecord::Base
  has_many :offerings
  has_many :csas, :through => :offerings
  
  belongs_to :user
end
