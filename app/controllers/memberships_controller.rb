class MembershipsController < ApplicationController
  before_filter :find_csa  
  
  
  def show
    @membership = Membership.find params[:id]
  end
  def create

    # does the user already exists?
    if logged_in?
      # just create a membership
    else
      user = User.new_placeholder_user params[:user]
      @membership = @csa.memberships.new :user => user, :share_notes => params[:membership][:share_notes]
      success = @membership && @membership.save && user.save
      if success && @membership.errors.empty?
        redirect_to "/csas/#{@csa.id}/memberships/#{@membership.id}"
      else
        flash.now[:error]  = "Something went wrong."
        render :action => 'new'
      end
      # create a user and a membership
    end
  end
  
  def find_csa
    @csa = Csa.find params[:csa_id]
  end
end
