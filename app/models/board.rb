class Board < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 32 }
end
