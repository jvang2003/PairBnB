class RequestsController < ApplicationController

  def create
    if signed_in?
      @residence = Residence.find(params[:residence_id])
      @availability = @residence.availabilities.find_by(date: params[:date])
      if @availability
        @request = Request.new(text: params[:request][:text], residence_id: @residence.id, date: params[:date], sender_id: current_user_id)
        @request.save
        flash[:sent_request_confirmation] = "We passed along your request-- they'll get in touch with you after confirmation. :)"
      end
      redirect_to residence_path(@residence)
    end
  end

  def destroy
    @request = Request.find_by(sender_id: params[:sender], date: params[:date])
    @request.try(:destroy)
    redirect_to user_path(User.find(session[:user_id]))
  end

end
