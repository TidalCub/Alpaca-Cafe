# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  layout 'bootstrap-mailer'
  default from: 'leon@leon-skinner.dev'
  layout 'mailer'
end
