class MqttService

  def send(topic, payload, order)
    CLIENT.publish(topic, payload, false)
    MqttLog.log(topic, payload, order)
  end
end