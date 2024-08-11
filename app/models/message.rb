class Message < ApplicationRecord
  belongs_to :user, foreign_key: "sender_id"

  validates :content, length: { minimum: 1 }, presence: true

end
