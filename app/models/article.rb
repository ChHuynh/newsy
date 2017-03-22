class Article < ActiveRecord::Base
  validates :title, :description, :url, :publish_date, presence: true
  validates :title, :url, :publish_date, uniqueness: true

  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user
end
