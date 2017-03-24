class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :source
  has_many :articles, through: :source

  validates_uniqueness_of :user_id, scope: :provider_id
end
