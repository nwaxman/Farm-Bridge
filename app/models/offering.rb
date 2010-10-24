class Offering < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :csa
  
  has_many :shares
  
  def to_s
    "#{vendor.description} from #{vendor.name}"
  end
  
  def depositless_shares
    shares.select{|s| !s.deposit_received?}
  end
  
  def deposit_received_shares
    shares.select{|s| s.deposit_received? && !s.paid?}
  end
  
  def paid_shares
    shares.select{|s| s.paid? }
  end
end
