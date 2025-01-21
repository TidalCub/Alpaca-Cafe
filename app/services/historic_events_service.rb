require 'faker'
require 'securerandom'
require 'json'

class HistoricEventsService
  EVENT_TYPES = %i[detail-page-view add-to-cart home-page-view purchase-complete]

  def initialize(count)
    @count = count
  end

  def generate
    File.open('events.json', 'w') do |f|
      @count.times do
        json_event = fake_journey.join("\n")
        f.puts(json_event) # Write each JSON object on a new line
      end
    end
  end

  private

  def response(att, user, time)
    {
      visitorId: user.id.to_s,
      sessionId: SecureRandom.uuid,
      eventTime: time,
      userInfo: {
        userId: user.id.to_s
      }
    }.merge(att).to_json # Convert the event to JSON without pretty-printing
  end

  def attributes_for_event_type(event_type, product = nil)
    case event_type.to_sym
    when :'detail-page-view'
      { event_type: event_type.to_s, productDetails: [{ product: { id: product.id.to_s } }] }
    when :'add-to-cart'
      { event_type: event_type.to_s, productDetails: [{ product: { id: product.id.to_s }, quantity: rand(1..10) }] }
    when :'home-page-view'
      { event_type: event_type.to_s }
    when :'purchase-complete'
      { event_type: event_type.to_s, productDetails: [{ product: { id: product.id.to_s }, quantity: rand(1..10) }] }
    else
      { error: "somthing broke #{event_type}" }
    end
  end

  def fake_journey
    user = User.order('RANDOM()').limit(1).first
    time = DateTime.parse(Faker::Time.between(from: DateTime.now - 100, to: DateTime.now).iso8601)
    att = []
    att << response(attributes_for_event_type(:'home-page-view'), user, time)
    return att unless rand(2) == 1

    product = Product.order('RANDOM()').limit(1).first
    att << response(attributes_for_event_type(:'detail-page-view', product), user, time + rand(1..200).seconds)

    case rand(3)
    when 0 # Abandon cart
      att << response(attributes_for_event_type(:'add-to-cart', product), user, time + rand(1..200).seconds)
    when 1 # Complete purchase
      att << response(attributes_for_event_type(:'add-to-cart', product), user, time + rand(1..200).seconds)
      att << response(attributes_for_event_type(:'purchase-complete', product), user, time + rand(1..200).seconds)
    when 2 # Abandon cart + return to home page
      att << response(attributes_for_event_type(:'home-page-view'), user, time + rand(1..200).seconds)
    end
    att
  end
end
