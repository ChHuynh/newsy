get "/users/new" do #registering a new user
@user = User.new #for error handling...?
  erb :"/users/new"
end

post "/users" do
@user = User.new(params[:user])
  if @user.save
    login(@user)
    redirect "/users/#{@user.id}"
  else
    erb :"/users/new" #error handling goes here
  end
end

get "/users/login" do

  erb :"users/login"
end

post "/users/login" do
  @user = User.find_by(username: params[:user][:username])
  if @user.authenticate(params[:user][:username], params[:user][:password])
    login(@user)
    redirect "/users/#{@user.id}"
  else
    erb :"users/login" #error handling goes here
  end
end

  get "/users/logout" do
    logout
    redirect "/"
  end

get "/users/:id" do
  if current_user

  erb :"/users/show"
  else
    redirect "/"
  end
end
