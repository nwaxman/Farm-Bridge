class VendorsController < ApplicationController

  def create
    @vendor = current_user.vendors.new params[:vendor]
    
    begin 
      @vendor.save!
      redirect_to vendor_path(@vendor)
    rescue ActiveRecord::RecordInvalid => e
      flash.now[:error]  = "Something went wrong."
      redirect_to new_vendor_path
    end
  end
  
  def update
    @vendor = Vendor.find params[:id]
    @vendor.update_attributes params[:vendor]
    redirect_to csa_url(@vendor.csas.first) # this is a HACK
  end
  
  
  def show
    @vendor = Vendor.find params[:id]
  end
end
