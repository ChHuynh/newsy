post "/news/:provider_id/subscribe" do
  @provider = Provider.find_by(id: params[:provider_id])
    if current_user
    @subscriber = Subscription.new(user_id: @user.id, provider_id: params[:provider_id])
      if @subscriber.save
        redirect "/users/#{@user.id}"
      end
    else
      redirect "/"
    end
  end


delete "/news/:provider_id/unsubscribe" do
  current_user
  @provider = Provider.find_by(id: params[:provider_id])
  @sub = @provider.subscriptions.find_by(user_id: @user.id)
  @sub.destroy


    redirect "/users/#{@user.id}"
end
