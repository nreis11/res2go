helpers do

  # set up a client to talk to the Twilio REST API

  # Add number
  my_twilio_num = '+14158710149'

  def create_below_min_msg(minimum, reservoir_name)
    msg = "The #{reservoir_name} reservoir has fallen below #{minimum}%!"
  end

  def create_above_max_msg(maximum, reservoir_name)
    msg = "The #{reservoir_name} reservoir has risen above #{maximum}%!"
  end

  def send_message(recipient, msg)
      client = Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']
      client.messages.create(
      from: "+14158710149",
      to: "+1" + recipient,
      body: msg,
      # media_url: 'http://static.progressivemediagroup.com/uploads/imagelibrary/nri/water/floridaresproj.jpg'
    )
  end

end