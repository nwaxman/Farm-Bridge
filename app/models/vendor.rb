class Vendor < ActiveRecord::Base
  has_many :offerings
  has_many :csas, :through => :offerings
end
