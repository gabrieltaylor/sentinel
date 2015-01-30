class Alert < ActiveRecord::Base
  belongs_to :incident

  def send_notification
    user = Incident.find_on_call_user
    notification = Notification.new(user)
    notification.send(self)
  end

  def speak_url
    incident_alert_speak(self)
  end
end
