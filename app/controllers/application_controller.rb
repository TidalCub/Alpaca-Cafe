# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :allow_iframe_requests

  rescue_from ActionPolicy::Unauthorized do
    redirect_to root_path, alert: t('application.alerts.no_permission')
  end

  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end

  # rescue_from StandardError do |exception|
  #   handle_exception(exception)
  #   #render 'errors/internal_server_error', status: :internal_server_error
  # end

  # private

  # def handle_exception(exception)
  #   Sentry.capture_exception(exception)
  #   logger.error(exception.message)
  #   logger.error(exception.backtrace.join("\n"))
  # end
end
