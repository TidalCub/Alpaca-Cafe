class MqttLogController < ApplicationController
  def index
    @logs = MqttLog.all
  end
end
