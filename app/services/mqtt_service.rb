# frozen_string_literal: true

class MqttService
  def initialize(*_args)
    @defined = defined?(CLIENT)
  end

  def send(topic, payload, order)
    CLIENT.publish(topic, payload, false) if @defined
    MqttLog.log(topic, payload, order)
  end
end
