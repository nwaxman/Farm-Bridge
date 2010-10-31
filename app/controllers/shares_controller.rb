class SharesController < ApplicationController
  before_filter :find_csa
  
  def edit
    @share = Share.find params[:id]
  end
  
  def update
    @share = Share.find params[:id]
    @share.update_attributes params[:share]
    redirect_to csa_url(@share.csa)
  end
  
  def create
    begin
      user = nil
      if logged_in?
        user = current_user
      else
        user = User.new_placeholder_user params[:user]
        user.save!      
      end
      
      selected_offering_ids = params[:offerings].collect{|k,v| k.to_i}
      selected_offering_ids.each do |offering_id|
        Share.create(:user_id => user.id, 
                      :offering_id => offering_id,
                      :notes => params[:notes])
      end
      redirect_to csa_url(@csa)
    rescue ActiveRecord::RecordInvalid => e
        redirect_to "/csas/#{@csa.id}/signup", {:flash => {:error => "Something went wrong: #{e}"}}
    end
    
   
  end
  
  def find_csa
    @csa = Csa.find params[:csa_id] if params[:csa_id] 
  end
end