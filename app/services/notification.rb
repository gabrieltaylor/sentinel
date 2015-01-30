class Notification
  def initialize(user)
    @user = user
  end

  def send(alert)
    auth = ENV['PLIVO_AUTH_ID']
    token = ENV['PLIVO_AUTH_TOKEN']
    plivo = RestAPI.new(auth, token)
    params = {
      "to" => user.contact_number, 
      "from" => ENV['PLIVO_NUMBER'], 
      "answer_url" => alert.speak_url,
      "answer_method" => "GET",
      "hangup_url" => "http://example.com/HangupUrl",
    }
    response = plivo.make_call params
  end

end
