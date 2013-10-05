class WelcomeController < ApplicationController
  layout 'special'
  def home
    Rails.logger.debug "entry home method"
    # raise 'Deliberate Failure'
    # render 'welcome/home', layout: 'special'
  end
end
