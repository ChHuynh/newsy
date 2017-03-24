def subscribed
@subscriber = Provider.first.subscriptions.where(user_id: params[:id])
end
#params[:id]
#params[]
