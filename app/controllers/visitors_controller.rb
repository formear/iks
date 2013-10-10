class VisitorsController < ApplicationController
  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(secure_params)
    if @visitor.save
      @visitor.subscribe
      VisitorMailer.welcome(@visitor.email).deliver
      Rails.logger.debug "email deliver have complete!"
      flash[:notice] = "Sing up #{@visitor.email} seccessfull!"
      redirect_to root_path
    else
      render 'new'
    end
    
  end

  private
  def secure_params
    params.require(:visitor).permit(:email)
  end
end
