get '/reservoirs' do
  @reservoirs = Reservoir.all
  erb :"/reservoirs/index"
end

get '/reservoirs/:id' do
  # Show reservoir
  erb :"/reservoirs/show"
end
