class Offering < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :csa
end
