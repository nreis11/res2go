get '/reservoirs' do
  @reservoirs = Reservoir.all
  erb :"/reservoirs/index"
end

post '/reservoirs' do
  p params
  reservoir_id = Reservoir.find_by(name: params["reservoir_name"]).id
  p reservoir_id
  @stat = Stat.new(user_id: current_user.id,
                   reservoir_id: reservoir_id,
                   floor_capacity: params["floor_capacity"],
                   ceiling_capacity: params["ceiling_capacity"]
                   )
  if @stat.save
    redirect "/users/#{current_user.id}"  
  else
    @errors = @stat.errors.full_messages
    erb :"/reservoirs/new"
  end

end

get '/reservoirs/new' do
  @user = current_user
  @reservoirs = Reservoir.all
  erb :"/reservoirs/new"
end

get '/reservoirs/:id' do
  # Show reservoir
  erb :"/reservoirs/show"
end


