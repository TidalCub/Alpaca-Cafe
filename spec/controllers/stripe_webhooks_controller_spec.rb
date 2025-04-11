require 'rails_helper'

RSpec.describe StripeWebhooksController, type: :controller do
  describe 'POST #payment_intents' do
    let(:valid_params) do
      {
        id: 'evt_test_webhook',
        type: 'payment_intent.succeeded',
        data: {
          object: {
            id: 'pi_test',
            metadata: {
              order_id: '123'
            }
          }
        }
      }
    end

    before do
      allow(StripeWebhooksService).to receive(:new).and_return(service_double)
    end

    let(:service_double) { instance_double(StripeWebhooksService, process_event: true) }

    context 'when the webhook is processed successfully' do
      it 'returns a 200 OK status' do
        post :payment_intents, params: valid_params
        expect(response).to have_http_status(:ok)
      end

      it 'calls the StripeWebhooksService with the correct parameters' do
        post :payment_intents, params: valid_params

        # Adjust the expectation to match the actual params passed to the service
        expected_params = ActionController::Parameters.new(valid_params.merge(
          'controller' => 'stripe_webhooks',
          'action' => 'payment_intents'
        ))

        expect(StripeWebhooksService).to have_received(:new).with(expected_params)
        expect(service_double).to have_received(:process_event)
      end
    end

    context 'when the webhook processing fails' do
      before do
        allow(service_double).to receive(:process_event).and_return(false)
      end

      it 'returns a 422 Unprocessable Entity status' do
        post :payment_intents, params: valid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end