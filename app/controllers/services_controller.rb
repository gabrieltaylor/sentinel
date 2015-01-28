class ServicesController < ApplicationController
  require 'net/http'
  before_action :authenticate_user!, except: :subscribe

  def subscribe
    @service = Service.find params[:service_id]
    @current_user = current_user

    message_type = request.headers["X_AMZ_SNS_MESSAGE_TYPE"]
    case message_type
    when "SubscriptionConfirmation"
      # verify_notification
      confirm_subscription(params["SubscribeURL"])
    when "Notification"
      # verify_notification
      @current_user.delay.notify(@service, params["Subject"], params["Message"])
      # Resque.enqueue(Watermark, file_token.key)
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
