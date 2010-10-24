class Member
  attr_accessor :user, :share
  
  def initialize(opts)
    @user = opts[:user]
    @share = opts[:share]
  end
  
  def self.csas_for_user(user)
    user.shares.collect{|s| s.csa}.flatten.uniq
  end
  
  def self.paid_members_for_csa(csa)
    shares = csa.offerings.collect{|o| o.shares}.flatten
    shares.select{|s| s.paid?}.collect{|s| s.user}.uniq
  end
  
  def self.unpaid_members_for_csa(csa)
    shares = csa.offerings.collect{|o| o.shares}.flatten
    shares.select{|s| !s.paid?}.collect{|s| s.user}.uniq
  end
  
  def self.deposit_received_members_for_csa(csa)
    shares = csa.offerings.collect{|o| o.shares}.flatten
    shares.select{|s| s.deposit_received?}.collect{|s| s.user}.uniq
  end
  
  def self.members_for_csa(csa)
    csa.offerings.collect{|o| o.shares}.flatten.uniq_by{|s| s.user_id}.collect do |share|
      Member.new :user => share.user
    end
  end
end
