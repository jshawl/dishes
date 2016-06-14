class Notification < ActiveRecord::Base
  belongs_to :created_by, :class_name => "User"
  belongs_to :sent_to, :class_name => "User"

  def self.notify user, message
    twilio_sid = ""
    twilio_token = ""
    twilio_phone_number = ""
 
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
 
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => user.phone,
      :body => message
    )
  end
end
