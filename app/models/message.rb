class Message < ApplicationRecord
  belongs_to :driver, foreign_key: "driver_id"

  validates :content, length: { minimum: 1 }, presence: true

  def self.get_dispatch_messages_for_driver(driver_id)
    Message.where(message_type: "D", driver_id:driver_id)
  end

  def self.get_area_messages_for_driver(driver_id)
    Message.where(message_type: "A", driver_id:driver_id)
  end
end
