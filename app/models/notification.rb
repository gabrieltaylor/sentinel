class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :alert

  def dispatch
    auth = ENV['PLIVO_AUTH_ID']
    token = ENV['PLIVO_AUTH_TOKEN']
    plivo = Plivo::RestAPI.new(auth, token)

    params = {
      "to" => self.user.contact_number, 
      "from" => ENV['PLIVO_NUMBER'], 
      "answer_url" => self.alert.speak_url,
      "answer_method" => "GET",
      "hangup_url" => "http://example.com/HangupUrl",
    }
    response = plivo.make_call params
  end

end
