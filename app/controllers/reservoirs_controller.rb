get '/reservoirs' do
  # List all reservoirs
  erb :"/reservoirs/index"
end

get '/reservoirs/:id' do
  # Show reservoir
  erb :"/reservoirs/show"
end
