class Article < ActiveRecord::Base
  validates :title, :description, :url, :publish_date, presence: true
  validates :title, :url, :publish_date, uniqueness: true

  belongs_to :provider
end
