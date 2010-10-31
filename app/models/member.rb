class Member
  attr_accessor :user, :share
  
  def initialize(opts)
    @user = opts[:user]
    @share = opts[:share]
  end
  
  def self.csas_for_user(user)
    user.shares.collect{|s| s.csa}.flatten.uniq
  end
  
  def self.members_for_csa(csa)
    csa.offerings.collect{|o| o.shares}.flatten.uniq_by{|s| s.user_id}.collect do |share|
      Member.new :user => share.user
    end
  end
  
  def self.managed_csa_for_user(user)
    Csa.find :first, :conditions => {:manager_id => user.id}
  end
end
