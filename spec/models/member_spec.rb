require 'spec_helper.rb'

describe "Member.members_for_csa" do
  before do
    @csa1 = mock(Csa, :name => "Csa1")
    @o = mock(Offering, :csa => @csa1)
    @csa1.stub!(:offerings => [@o])
    @s1 = mock(Share, :offering => @o)
    @s2 = mock(Share, :offering => @o)
    @o.stub!(:shares => [@s1, @s2])
    @u1 = mock(User, :shares => [@s1])
    @u2 = mock(User, :shares => [@s2])
    @s1.stub!(:user => @u1)
    @s2.stub!(:user => @u2)
    @u3 = mock(User)
  end
  
  it "should return all members corresponding to the users who have shares in any of the CSA's offerings" do
    Member.users_for_csa(@csa1).should == [@u1,@u2]
  end

end

describe "Member.csas_for_user with shares"  do
  before do
    @csa1 = Csa.new
    @csa2 = Csa.new
    @share1 = mock(Share, :csa => @csa1)
    @share2 = mock(Share, :csa => @csa2)
    @u1 = mock(User, :shares => [@share1, @share2])
  end
  
  it "should return an array" do
    Member.csas_for_user(@u1).should be_an_instance_of(Array)
  end
  
  it "should return shares" do
    Member.csas_for_user(@u1).first.should be_an_instance_of(Csa)
  end
end

describe "Member.csas_for_user without shares" do
  before do
    @user1 = User.new
  end
  
  it "should return an empty array" do
    Member.csas_for_user(@user1).should be_an_instance_of(Array)
    Member.csas_for_user(@user1).should be_empty    
  end
end

