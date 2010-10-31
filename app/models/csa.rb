class Csa < ActiveRecord::Base
  belongs_to :manager, :class_name => 'User'
  has_many :offerings
  has_many :shares, :through => :offerings
  has_many :users, :through => :shares
  
  after_create :create_default_offering
  
  def to_s
    name
  end
  
  def create_default_offering
    vendor = Vendor.create :user_id => self.manager_id,
                           :name => "Our Farm" 
    Offering.create :vendor => vendor, :csa => self             
  end
end
