# TODO
# Incorporate Twilio API
# Allow server to send notification when adding a reservoir

get '/' do
  redirect '/reservoirs'
end

get '/session-viewer' do
  p session
end

get '/session-clearer' do
  session.clear
end
