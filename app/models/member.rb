class Member
  def initialize(opts)
    
  end
  
  def save
  end
  
  def self.csas_for_user(user)
    user.shares.collect{|s| s.csa}.flatten.uniq
  end
  
  def self.users_for_csa(csa)
    csa.offerings.collect{|o| o.shares}.flatten.collect{|s| s.user}.uniq
  end
end
