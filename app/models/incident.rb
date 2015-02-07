class Incident < ActiveRecord::Base
  has_many :alerts
  belongs_to :account

  def notify(service, subject, message)
    user = account.users.first
    alert = alerts.create(subject: subject, message: message)

    notification = alert.notifications.create(user: user)

    notification.dispatch
  end
end
