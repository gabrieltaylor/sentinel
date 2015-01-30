require 'rails_helper'

RSpec.describe "sns subscribe", :type => :request do
  it "makes get request to Amazon and returns a 200 OK" do
    user = User.create!(email: "gabe@example.com", password: "secretlyaterriblepassword")
    service = Service.create!(user: user, name: "SNS test")
    body = {
      "Type" => "SubscriptionConfirmation",
      "MessageId" => "165545c9-2a5c-472c-8df2-7ff2be2b3b1b",
      "Token" => "2336412f37fb687f5d51e6e241d09c805a5a57b30d712f794cc5f6a988666d92768dd60a747ba6f3beb71854e285d6ad02428b09ceece29417f1f02d609c582afbacc99c583a916b9981dd2728f4ae6fdb82efd087cc3b7849e05798d2d2785c03b0879594eeac82c01f235d0e717736",
      "TopicArn" => "arn:aws:sns:us-east-1:123456789012:MyTopic",
      "Message" => "You have chosen to subscribe to the topic arn:aws:sns:us-east-1:123456789012:MyTopic.\nTo confirm the subscription, visit the SubscribeURL included in this message.",
      "SubscribeURL" => "https://sns.us-east-1.amazonaws.com/?Action=ConfirmSubscription&TopicArn=arn:aws:sns:us-east-1:123456789012:MyTopic&Token=2336412f37fb687f5d51e6e241d09c805a5a57b30d712f794cc5f6a988666d92768dd60a747ba6f3beb71854e285d6ad02428b09ceece29417f1f02d609c582afbacc99c583a916b9981dd2728f4ae6fdb82efd087cc3b7849e05798d2d2785c03b0879594eeac82c01f235d0e717736",
      "Timestamp" => "2012-04-26T20:45:04.751Z",
      "SignatureVersion" => "1",
      "Signature" => "EXAMPLEpH+DcEwjAPg8O9mY8dReBSwksfg2S7WKQcikcNKWLQjwu6A4VbeS0QHVCkhRS7fUQvi2egU3N858fiTDN6bkkOxYDVrY0Ad8L10Hs3zH81mtnPk5uvvolIC1CXGu43obcgFxeL3khZl8IKvO61GWB6jI9b5+gLPoBc1Q=",
      "SigningCertURL" => "https://sns.us-east-1.amazonaws.com/SimpleNotificationService-f3ecfb7224c7233fe7bb5f59f96de52f.pem"
    }
    headers = {"X_AMZ_SNS_MESSAGE_TYPE" => "SubscriptionConfirmation"}

    stub_request(:get, "https://sns.us-east-1.amazonaws.com/?Action=ConfirmSubscription&Token=2336412f37fb687f5d51e6e241d09c805a5a57b30d712f794cc5f6a988666d92768dd60a747ba6f3beb71854e285d6ad02428b09ceece29417f1f02d609c582afbacc99c583a916b9981dd2728f4ae6fdb82efd087cc3b7849e05798d2d2785c03b0879594eeac82c01f235d0e717736&TopicArn=arn:aws:sns:us-east-1:123456789012:MyTopic").
       with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Host'=>'sns.us-east-1.amazonaws.com', 'User-Agent'=>'Ruby'}).
       to_return(:status => 200, :body => "", :headers => {})

    post "/users/#{user.id}/services/#{service.id}/subscribe", body, headers

    expect(response.code).to eql("200")
  end
end

RSpec.describe "sns notification", :type => :request do
  it "returns 200 OK" do
    user = User.create!(email: "gabe@example.com", password: "secretlyaterriblepassword")
    service = Service.create!(user: user, name: "SNS test")
    body = {
      "Type" => "Notification",
      "MessageId" => "22b80b92-fdea-4c2c-8f9d-bdfb0c7bf324",
      "TopicArn" => "arn:aws:sns:us-east-1:123456789012:MyTopic",
      "Subject" => "My First Message",
      "Message" => "Hello world!",
      "Timestamp" => "2012-05-02T00:54:06.655Z",
      "SignatureVersion" => "1",
      "Signature" => "EXAMPLEw6JRNwm1LFQL4ICB0bnXrdB8ClRMTQFGBqwLpGbM78tJ4etTwC5zU7O3tS6tGpey3ejedNdOJ+1fkIp9F2/LmNVKb5aFlYq+9rk9ZiPph5YlLmWsDcyC5T+Sy9/umic5S0UQc2PEtgdpVBahwNOdMW4JPwk0kAJJztnc=",
      "SigningCertURL" => "https://sns.us-east-1.amazonaws.com/SimpleNotificationService-f3ecfb7224c7233fe7bb5f59f96de52f.pem",
      "UnsubscribeURL" => "https://sns.us-east-1.amazonaws.com/?Action=Unsubscribe&SubscriptionArn=arn:aws:sns:us-east-1:123456789012:MyTopic:c9135db0-26c4-47ec-8998-413945fb5a96"
    }
    headers = {"X_AMZ_SNS_MESSAGE_TYPE" => "Notification"}

    post "/users/#{user.id}/services/#{service.id}/subscribe", body, headers

    expect(response.code).to eql("200")
  end
end
