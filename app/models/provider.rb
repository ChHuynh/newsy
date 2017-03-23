class Provider < ActiveRecord::Base
  has_many :articles
  has_many :subscriptions
end
