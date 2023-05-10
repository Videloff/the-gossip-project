class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gossip, dependant: :destroy
  belongs_to :commentable, polymorphic: true
  has_many :likes, as: :likeable

  validates :content, presence: true
end
