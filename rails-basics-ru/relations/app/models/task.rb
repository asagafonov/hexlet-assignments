class Task < ApplicationRecord
  belongs_to :user
  belongs_to :status

  scope :by_creation_date_desc, -> { order(created_at: :desc) }

  validates :name, :description, presence: true
end
