
# LOGIN PAGE
get '/sessions/new' do
  if request.xhr?
    erb :'sessions/new', layout: false
  else
    erb :'sessions/new'
  end
end

# CHECK LOGIN
post '/sessions' do
  @user = User.find_by_email(params[:email])

  if @user && @user.password == params[:password]
    # session[:id] = @user.id
    login(@user)
    redirect "/users/#{@user.id}"

  else
    @errors = ["Username and Password not found."]
    erb :'sessions/new'
  end
end

# delete '/sessions/:id' do
delete '/sessions' do
  # session[:id] = nil
  logout
  redirect '/'
end

#Debugging
get '/session-viewer' do
  p session
end

get '/session-clearer' do
  p session
  session.clear
  p session
end
