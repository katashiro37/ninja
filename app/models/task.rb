class Task < ApplicationRecord
  belongs_to :user

  validates :name, :user_id, presence: true
  validates :name, length: {minimum: 2}
#   validates :name, format: { with: /\A[a-zA-Z]+\z/,
# message: "Only letters are allowed" }

end
