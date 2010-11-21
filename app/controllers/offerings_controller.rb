class OfferingsController < ApplicationController
  before_filter :find_csa
  
  def new
    @offering = @csa.offerings.new
  end
  
  def edit
    @offering = Offering.find params[:id]
  end
  
  def create
    begin
      @vendor = current_user.vendors.create! params[:vendor]
      @offering = Offering.create! :vendor => @vendor, :csa => @csa
      
      if @csa.offerings.count == 1
        flash[:notice]  = "You have now set up your CSA. Congratulations!!"
      end
      
      redirect_to csa_url(@csa)
    rescue ActiveRecord::RecordInvalid => e
      redirect_to new_csa_offering_url(@csa)
    end
  end
  
  def find_csa
    @csa = Csa.find params[:csa_id] if params[:csa_id]
  end
end
