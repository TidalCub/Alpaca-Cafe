# frozen_string_literal: true

require 'rails_helper'
require 'stripe'

RSpec.describe StripeWebhooksService, type: :service do
  describe '#process_event' do
    let(:order) { create(:order, payment_intent: 'pi_test') }
    let(:params) do
      {
        id: 'evt_test_webhook',
        type: event_type,
        data: {
          object: {
            id: 'pi_test',
            metadata: {
              order_id: order.id
            }
          }
        }
      }
    end
    let(:event) do
      double(
        'Stripe::Event',
        type: event_type,
        data: double(object: double(id: 'pi_test', metadata: { order_id: order.id }))
      )
    end

    before do
      allow(Stripe::Event).to receive(:retrieve).and_return(event)
      allow(Order).to receive(:find_by).and_return(order)
      allow(order).to receive(:captured!)
    end

    context 'when the event type is charge_captured' do
      let(:event_type) { 'charge.captured' }

      it 'calls the charge_captured method' do
        service = StripeWebhooksService.new(params)
        expect(service).to receive(:charge_captured).and_call_original
        service.process_event
        expect(order).to have_received(:captured!)
      end
    end

    context 'when the event type is payment_intent_succeeded' do
      let(:event_type) { 'payment_intent.succeeded' }

      it 'calls the payment_intent_succeeded method' do
        service = StripeWebhooksService.new(params)
        expect(service).to receive(:payment_intent_succeeded).and_call_original
        service.process_event
      end
    end

    context 'when the event type is unhandled' do
      let(:event_type) { 'unknown.event' }

      it 'logs a warning for the unhandled event type' do
        service = StripeWebhooksService.new(params)
        expect(Rails.logger).to receive(:warn).with("Unhandled event type: #{event_type}")
        service.process_event
      end
    end
  end
end
