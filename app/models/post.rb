class Post < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  has_many :comments, dependent: :destroy

end
