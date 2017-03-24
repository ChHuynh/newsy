class User < ActiveRecord::Base
  validates :username, :password_hash, presence: true
  validates :username, uniqueness: true

has_many :subscriptions
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(username_input, password_input)
    self.username == username_input && self.password == password_input
  end

end
