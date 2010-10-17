class CsasController < ApplicationController
  def show
    @csa = Csa.find(params[:id])
  end
  
  def create
    @csa = Csa.new(params[:csa])
    @csa.users << current_user
    success = @csa && @csa.save
    
    membership = @csa.memberships.first
    membership.manager = true
    membership.save

    if success && @csa.errors.empty?
      redirect_to csa_path(@csa)
    else
      flash.now[:error]  = "Something went wrong."
      render :action => 'new'
    end
  end
end
