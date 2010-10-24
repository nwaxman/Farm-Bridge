class Offering < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :csa
  
  def to_s
    "#{vendor.description} from #{vendor.name}"
  end
end
