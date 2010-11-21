class CsasController < ApplicationController
  before_filter :find_csa, :except => [:signup, :create, :new]
  
  def show
  end
  
  def signup
  end
  
  def edit
  end
  
  def update
    @csa.update_attributes params[:csa]
    redirect_to csa_url(@csa)
  end
  
  def members
  end
  
  def add_member
  end
  
  def create_member
    begin
      @user = User.new_placeholder_user(params[:user])
      @user.save!

      Share.create!( :user => @user, :offering => @csa.offerings.first, :agreement => params[:share][:agreement] )    
      flash[:notice] = "Member successfully added."
      redirect_to "/csas/#{@csa.id}/members"
    rescue ActiveRecord::RecordInvalid => e
      flash[:error] = "Something went wrong: #{e}"
      redirect_to "/csas/#{@csa.id}/add_member"
    end
    
    
  end
  
  def create
    @csa = Csa.new(params[:csa])
    @csa.manager_id = current_user.id

    success = @csa && @csa.save
    
    if success && @csa.errors.empty?
      flash[:notice] = "Congrats! Your CSA is now setup."
#      redirect_to "/csas/#{@csa.id}/offerings/#{@csa.offerings.first.id}/edit"
      redirect_to "/csas/#{@csa.id}"

    else
      flash.now[:error]  = "Something went wrong."
      render :action => 'new'
    end
  end
  
  def find_csa
    @csa = Csa.find params[:id]
  end
end
