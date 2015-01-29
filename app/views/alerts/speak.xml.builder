xml.Response {
  xml.Speak(
    "Hello, this is a message from Sentinel. #{@alert.subject}: #{@alert.message}",
    :language=>"en-US",
    :loop=>"1",
    :voice=>"WOMAN"
  )
}
