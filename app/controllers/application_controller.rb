# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :allow_iframe_requests

  rescue_from ActionPolicy::Unauthorized do
    redirect_to root_path, alert: t('application.alerts.no_permission')
  end

  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end
end
