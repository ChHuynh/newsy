class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :source
  has_many :articles, through: :source
end
