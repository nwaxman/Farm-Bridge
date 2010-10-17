class Member
  def self.csas_for_user(user)
    user.shares.collect{|s| s.csa}.flatten
  end
end