class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  default_scope { order(created_at: :desc) }
  # reorders the recodes in index
  belongs_to :user
end
