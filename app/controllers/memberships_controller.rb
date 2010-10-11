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
      begin
        user = User.new_placeholder_user params[:user]
        user.save!
        @membership = @csa.memberships.new :user => user, :share_notes => params[:membership][:share_notes]
        @membership.save!
        redirect_to "/csas/#{@csa.id}/memberships/#{@membership.id}"
      rescue ActiveRecord::RecordInvalid => e
        redirect_to "/csas/#{@csa.id}/memberships/new", {:flash => {:error => "Something went wrong: #{e}"}}
      end
    end
  end
  
  def find_csa
    @csa = Csa.find params[:csa_id]
  end
end
