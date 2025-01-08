# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'state transitions' do
    before do
      VCR.use_cassette('stripe_customer_create') do
        @user = create(:user)
      end
    end

    let(:order) { create(:order, user: @user, state: 'on_checkout') }

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

    context 'when transitioning to requires_capture' do
      it 'transitions from on_checkout to requires_capture and sends order confirmation email' do
        expect(OrderMailer).to receive(:order_confirmation).with(order).and_return(double(deliver_now!: true))
        order.requires_capture!
        expect(order.state).to eq('requires_capture')
      end
    end

    context 'when transitioning to paid' do
      before do
        order.update(state: 'requires_capture')
      end

      it 'transitions from requires_capture to paid, captures payment, and sends payment confirmation email' do
        expect(OrderMailer).to receive(:payment_confirmation).with(order).and_return(double(deliver_now!: true))
        expect_any_instance_of(StripePaymentintentService).to receive(:capture)
        order.check_in!
        expect(order.state).to eq('paid')
      end
    end

    context 'when transitioning to completed' do
      before do
        order.update(state: 'paid')
      end

      it 'transitions from paid to completed' do
        order.complete!
        expect(order.state).to eq('completed')
      end
    end
  end
end
