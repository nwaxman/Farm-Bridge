class Csa < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships
  
  def paid_members
    memberships.find(:all, :conditions => {:paid => true})
  end
  
  def unpaid_members
    memberships.find(:all, :conditions => {:paid => false})
  end
  
  def to_s
    name
  end
end
