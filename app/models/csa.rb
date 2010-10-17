class Csa < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships
  
  def deposit_received_members
    memberships.find(:all, :conditions => {:deposit_received => true, :paid => false})
  end
  
  def paid_members
    memberships.find(:all, :conditions => {:paid => true})
  end
  
  def unpaid_members
    memberships.find(:all, :conditions => {:paid => false})
  end
  
  def manager
    memberships.find(:first, :conditions => {:manager => true}).user
  end
  
  def to_s
    name
  end
end
