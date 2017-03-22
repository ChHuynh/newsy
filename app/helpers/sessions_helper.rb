 def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.destroy
  end

  def current_user
    @user = User.find_by(id: session[:user_id])
  end
