# SHOW ALL RESERVOIRS
get '/reservoirs' do
  @reservoirs = Reservoir.all
  erb :"/reservoirs/index"
end

# CREATE NEW RESERVOIR FOR USER
post '/reservoirs' do
  reservoir_id = Reservoir.find_by(name: params["reservoir_name"]).id
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
  if request.xhr?
    erb :"/reservoirs/_new", layout: false
  else
    erb :"/reservoirs/new"
  end
end

# get '/reservoirs/:id' do
#   # Show reservoir
#   erb :"/reservoirs/show"
# end

# GET UPDATE FORM
get '/reservoirs/:id/edit' do
  @stat_to_update = Stat.find_by(user_id: current_user.id, reservoir_id: params[:id])
  @reservoir = Reservoir.find(params[:id])
  erb :"/reservoirs/edit"
end

# UPDATE RESERVOIR ROUTE
put '/reservoirs/:id' do
  @stat_to_update = Stat.find_by(user_id: current_user.id, reservoir_id: params[:id])
  @stat_to_update.update(minimum_threshold: params[:minimum_threshold],
                        maximum_threshold: params[:maximum_threshold])
  redirect "/users/#{current_user.id}"
end


# DELETE A RESERVOIR
delete '/reservoirs/:id' do
  @stat_to_destroy = Stat.find_by(user_id: current_user.id, reservoir_id: params[:id])
  @stat_to_destroy.destroy
  redirect "/users/#{current_user.id}"
end


