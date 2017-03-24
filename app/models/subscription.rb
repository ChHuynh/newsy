class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :provider
  has_many :articles, through: :provider

  validates_uniqueness_of :user_id, scope: :provider_id
end
