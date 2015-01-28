class ServicesController < ApplicationController
  require 'net/http'

  def subscribe
    # /users/:user_id/services/:service_id/subscribe
    # either the service is being confirmed 
    # or a message is arriving from SNS
    message_type = request.headers["X_AMZ_SNS_MESSAGE_TYPE"]
    case message_type
    when "SubscriptionConfirmation"
      # verify_notification
      confirm_subscription(params["SubscribeURL"])
    when "Notification"
      puts "Notified"
    when "UnsubscribeConfirmation"
      puts "Unsubscribed"
    end

    render plain: "OK"
  end

  private

  def confirm_subscription(url)
    uri = URI(url)
    response = Net::HTTP.get(uri)
  end

end
