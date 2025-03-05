unless Rails.env.local?
  CLIENT = MQTT::Client.new(
    host: Rails.application.credentials.dig(Rails.env.to_sym, :mqtt, :host),
    port: Rails.application.credentials.dig(Rails.env.to_sym, :mqtt, :port),
    username: Rails.application.credentials.dig(Rails.env.to_sym, :mqtt, :username),
    password: Rails.application.credentials.dig(Rails.env.to_sym, :mqtt, :password)
  )
  CLIENT.connect()
end

