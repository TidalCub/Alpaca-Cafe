# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:user) { create(:user) }
  let(:order) { create(:order, user:, state: 'pending') }

  describe 'state transitions' do
    context 'when transitioning from pending to paid' do
      it 'transitions to paid state' do
        expect(order.may_pay?).to be true
        order.pay!
        expect(order.state).to eq('paid')
      end
    end

    context 'when transitioning from paid to completed' do
      before do
        order.pay!
      end

      it 'transitions to completed state' do
        expect(order.may_complete?).to be true
        order.complete!
        expect(order.state).to eq('completed')
      end
    end

    context 'when transitioning from pending to checkout' do
      before do
        create(:order_item, order: order)
      end
      it 'creates a payment_intent' do
        VCR.use_cassette('stripe_order_model') do
          order.checkout!
          expect(order.payment_intent).to eq 'pi_3QUVXeFWpgsj4fDK05NxCc94'
        end
      end

      it 'creates a client_secret' do
        VCR.use_cassette('stripe_order_model') do
          order.checkout!
          expect(order.client_secret).to eq 'pi_3QUVXeFWpgsj4fDK05NxCc94_secret_sl8a0nX9wXubwCWAzEsldI7Tw'
        end
      end

      context 'when a payment intent exists' do
        before do
          order.payment_intent = 'pi_3QUVXeFWpgsj4fDK05NxCc94'
          order.client_secret = 'pi_3QUVXeFWpgsj4fDK05NxCc94_secret_sl8a0nX9wXubwCWAzEsldI7Tw'
          order.save
          create(:order_item, order: order)
        end

        it 'updates the payment intent' do
          VCR.use_cassette('stripe_update_intent') do
            order.checkout!
            expect(order.payment_intent).to eq 'pi_3QUVXeFWpgsj4fDK05NxCc94'
          end
        end
      end
    end
  end
end
