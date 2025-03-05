class MqttLog < ApplicationRecord
  belongs_to :order

  def self.log(topic, payload, order)
    create(topic:, message: payload, order: )
  end
end
