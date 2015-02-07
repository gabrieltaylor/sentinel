class ServicesController < ApplicationController
  require 'net/http'
  before_action :authenticate_user!, except: :subscribe

  def subscribe
    @service = Service.find params[:service_id]
    @account = Account.find params[:account_id]

    message_type = request.headers["X_AMZ_SNS_MESSAGE_TYPE"]
    case message_type
    when "SubscriptionConfirmation"
      # verify_notification
      confirm_subscription(params["SubscribeURL"])
    when "Notification"
      # verify_notification
      # open a new incident if one is not already open
      incident = @account.get_or_create_incident_for(@service)
      incident.delay.notify(@service, params["Subject"], params["Message"])
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
