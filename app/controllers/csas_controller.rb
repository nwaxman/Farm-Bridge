class CsasController < ApplicationController
  def show
    @csa = Csa.find(params[:id])
  end
  
  def signup
  end
  
  def edit
    @csa = Csa.find(params[:id])
  end
  
  def update
    @csa = Csa.find(params[:id])
    @csa.update_attributes params[:share]
    redirect_to csa_url(@csa)
  end
  
  def members
    @csa = Csa.find(params[:id])
  end
  
  def create
    @csa = Csa.new(params[:csa])
    @csa.manager_id = current_user.id

    success = @csa && @csa.save
    
    if success && @csa.errors.empty?
      redirect_to "/csas/#{@csa.id}/offerings/#{@csa.offerings.first.id}/edit"
    else
      flash.now[:error]  = "Something went wrong."
      render :action => 'new'
    end
  end
end
