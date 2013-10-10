class Visitor < ActiveRecord::Base
  validates  :email, presence: true, :format => {with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i }

  def subscribe
    mailchimp = Gibbon::API.new
    result = mailchimp.lists.subscribe({
      id: ENV['MAILCHIMP_LIST_ID'],
      email: {email: self.email},
      double_optin: false,
      update_existing: true,
      send_welcome: false
    })

    Rails.logger.info("Subscribed #{self.email} to Mailchimp") if result

  end
end
