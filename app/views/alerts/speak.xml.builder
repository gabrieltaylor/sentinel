xml.Response {
  xml.Speak(:language=>"en-US", :loop=>"1", :voice=>"WOMAN"){
    "Hello, this is a message from Sentinel. #{@alert.subject}: #{@alert.message}"
  }
}
