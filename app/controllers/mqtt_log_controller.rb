# frozen_string_literal: true

class MqttLogController < ApplicationController
  def index
    @logs = MqttLog.all
  end
end
