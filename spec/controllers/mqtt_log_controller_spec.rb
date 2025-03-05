# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MqttLogController, type: :controller do
  describe 'GET #index' do
    before do
      FactoryBot.create_list(:mqtt_log, 10)
    end

    it 'shows all the mqtt logs' do
      get :index
      expect(assigns(:logs)).to eq(MqttLog.all)
    end
  end
end
