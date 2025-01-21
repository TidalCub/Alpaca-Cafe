require 'net/http'
require 'json'
require 'googleauth'

class GoogleRetailTagService
  GOOGLE_API_URL = 'https://retail.googleapis.com/v2/projects/aplaca-cafe/locations/global/catalogs/default_catalog/userEvents:write'
  SERVICE_ACCOUNT_JSON = Rails.root.join('config/google_service_account.json')

  def initialize(user)
    @user = user
    @access_token = fetch_access_token
  end

  def new_event(event_type, product, qty = nil)
    return unless @access_token

    send_request(request_body(event_type, product, qty))
  end

  def home_event
    return unless @access_token

    send_request(home_request_body)
  end

  private

  def send_request(request_body)
    uri = URI(GOOGLE_API_URL)
    request = Net::HTTP::Post.new(uri)
    request['Authorization'] = "Bearer #{@access_token}"
    request['Content-Type'] = 'application/json; charset=utf-8'
    request.body = request_body

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    log_response(response)
  end

  def home_request_body
    {
      eventType: 'home-page-view',
      visitorId: @user.id.to_s,
      sessionId: SecureRandom.uuid,
      eventTime: Time.now.utc.iso8601,
      userInfo: {
        userId: @user.id.to_s
      }
    }.compact.to_json
  end

  def request_body(event_type, product, qty)
    {
      eventType: event_type,
      visitorId: @user.id.to_s,
      sessionId: SecureRandom.uuid,
      eventTime: Time.now.utc.iso8601,
      productDetails: [{
        product: { id: product.id.to_s },
        quantity: qty
      }],
      userInfo: {
        userId: @user.id.to_s
      }
    }.compact.to_json
  end

  def fetch_access_token
    scope = 'https://www.googleapis.com/auth/cloud-platform'
    authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(SERVICE_ACCOUNT_JSON),
      scope: scope
    )
    authorizer.fetch_access_token!['access_token']
  rescue StandardError => e
    Rails.logger.error "Failed to fetch Google Retail API access token: #{e.message}"
    nil
  end

  def log_response(response)
    if response.code.to_i == 200
      Rails.logger.info "\n\n\n\n\n\n\nSuccessfully sent event to Google Retail API: #{response.body}"
    else
      Rails.logger.error "\n\n\n\n\n\nFailed to send event: #{response.code} - #{response.body}"
    end
  end
end
