class MqttService

  def send(topic, payload)
    CLIENT.publish(topic, payload, false)
  end
end