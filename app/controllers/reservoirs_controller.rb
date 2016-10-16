# SHOW ALL RESERVOIRS
get '/reservoirs' do
  @reservoirs = Reservoir.all
  erb :"/reservoirs/index"
end

# CREATE NEW RESERVOIR FOR USER
post '/reservoirs' do
  p params
  reservoir_id = Reservoir.find_by(name: params["reservoir_name"]).id
  p reservoir_id
  @stat = Stat.new(user_id: current_user.id,
                   reservoir_id: reservoir_id,
                   minimum_threshold: params["minimum_threshold"],
                   maximum_threshold: params["maximum_threshold"]
                   )
  if @stat.save
    redirect "/users/#{current_user.id}"  
  else
    @errors = @stat.errors.full_messages
    erb :"/reservoirs/new"
  end

end

# ADD A NEW RESERVOIR FORM
get '/reservoirs/new' do
  @user = current_user
  @reservoirs = Reservoir.all
  erb :"/reservoirs/new"
end

get '/reservoirs/:id' do
  # Show reservoir
  erb :"/reservoirs/show"
end

# DELETE A RESERVOIR
delete '/reservoirs/:id' do
  @stat_to_destroy = Stat.find_by(user_id: current_user.id, reservoir_id: params[:id]) 
  @stat_to_destroy.destroy
  debug(@stat_to_destroy)
  redirect "users/#{current_user.id}"
end


