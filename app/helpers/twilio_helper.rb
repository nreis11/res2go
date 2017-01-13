helpers do

  # set up a client to talk to the Twilio REST API

  # Add number
  

  def create_below_min_msg(minimum, reservoir_name)
    msg = "The #{reservoir_name} reservoir has fallen below #{minimum}%!"
  end

  def create_above_max_msg(maximum, reservoir_name)
    msg = "The #{reservoir_name} reservoir has risen above #{maximum}%!"
  end

  def send_message(recipient, msg)
    my_twilio_num = '+14158710149'
    compatible_nums = ['5108597696']
    if compatible_nums.include?(recipient)
      client = Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']
      client.messages.create(
      from: my_twilio_num,
      to: "+1" + recipient,
      body: msg,
      media_url: 'https://upload.wikimedia.org/wikipedia/commons/5/56/Aerial_view_-_Shasta_Dam_CA.jpg'
    )
    end
  end

end
