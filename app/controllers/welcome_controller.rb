class WelcomeController < ApplicationController
  layout 'special'
  def home
    Rails.logger.debug "entry home method"
    flash.now[:notice] = "flash now test!"
    # redirect_to root_path
    # raise 'Deliberate Failure'
    # render 'welcome/home', layout: 'special'
  end
end
