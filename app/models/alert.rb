class Alert < ActiveRecord::Base
  belongs_to :incident
  has_many :notifications

  def speak_url
    Rails.application.routes.url_helpers.incident_alert_speak_url(self.incident, self, :host => 'server.com')
  end
end
