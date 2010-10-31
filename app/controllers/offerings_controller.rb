class OfferingsController < ApplicationController
  before_filter :find_csa
  
  def new
    @offering = @csa.offerings.new
  end
  
  def create
    begin
      @vendor = Vendor.create! params[:vendor]
      @offering = Offering.create! :vendor => @vendor, :csa => @csa
      redirect_to csa_url(@csa)
    rescue ActiveRecord::RecordInvalid => e
      redirect_to new_csa_offering_url(@csa)
    end
  end
  
  def find_csa
    @csa = Csa.find params[:csa_id] if params[:csa_id]
  end
end
