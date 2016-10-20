# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

# Add number
my_twilio_num = '+14158710149'

def create_below_min_msg(phone_number, minimum, reservoir_name)
  recipient = '+1' + phone_number.to_s
  msg = "The #{reservoir_name} reservoir has fallen below #{minimum}%!"
  send_message(recipient, msg)
end

def create_above_max_msg(phone_number, maximum, reservoir_name)
  recipient = '+1' + phone_number.to_s
  msg = "The #{reservoir_name} reservoir has risen above #{maximum}%!"
  send_message(recipient, msg)
end

def send_message(recipient, msg)
  @client.messages.create(
    from: "+14158710149",
    to: recipient,
    body: msg,
    # media_url: 'http://static.progressivemediagroup.com/uploads/imagelibrary/nri/water/floridaresproj.jpg'
  )
end

# Send test messages
# create_below_min_msg(5108597696, 30, "Shasta")
# create_above_max_msg(5105417505, 80, "Shasta")
