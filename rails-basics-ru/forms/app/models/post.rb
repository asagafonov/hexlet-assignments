class Post < ApplicationRecord
  validates :title, :body, :summary, presence: true
end
