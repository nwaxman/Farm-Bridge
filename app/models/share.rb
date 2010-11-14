class Share < ActiveRecord::Base
  belongs_to :user
  belongs_to :offering
  
  validates_presence_of :agreement

  def csa
    self.offering.csa
  end
end
