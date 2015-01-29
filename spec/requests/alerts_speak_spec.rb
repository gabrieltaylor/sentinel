require 'rails_helper'

RSpec.describe "sns subscribe", :type => :request do
  it "makes get request to Amazon and returns a 200 OK" do
    user = User.create!(email: "gabe@example.com", password: "secretlyaterriblepassword")
    incident = Incident.create!(name: "Test Incident", description: "Everything is on fire")
    alert = Alert.create!(incident: incident, subject: "Hello", message: "World!")

    headers = {"Content-Type" => "text/xml"}
    params = {}

    get "/incidents/#{incident.id}/alerts/#{alert.id}/speak", params, headers

    expected = '<Response>
  <Speak language="en-US" loop="1" voice="WOMAN">Hello, this is a message from Sentinel. Hello: World!</Speak>
</Response>
'
    expect(response.code).to eql("200")
    expect(response.body).to eql(expected)
  end
end
