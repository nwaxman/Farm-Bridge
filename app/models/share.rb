class Share < ActiveRecord::Base
  belongs_to :user
  belongs_to :offering


  def csa
    self.offering.csa
  end
end
