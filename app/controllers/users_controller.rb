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
    @providers = Provider.all
    @subscriber_feed = Subscription.where(user_id: params[:id])
    @subscriber_feed.each_slice(2) do |subscription|
      subscription.each do |sub|

        sub.articles.each do |article|

          p article.title

        end

      end

    end

  erb :"/users/show"
  else
    redirect "/"
  end
end
