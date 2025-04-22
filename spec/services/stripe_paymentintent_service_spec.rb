# frozen_string_literal: true

# spec/services/stripe_paymentintent_service_spec.rb
require 'rails_helper'

RSpec.describe StripePaymentintentService, type: :service do
  before do
    VCR.use_cassette('stripe_customer_create') do
      @user = create(:user, email: 'test@example.com', stripe_id: 'cus_RO4kYXL8E8Symo')
    end
  end

  let(:user) { @user }
  let(:store) { create(:store) }
  let(:order) { create(:order, user:, store:) }
  let(:amount) { 1000 }
  let(:service) { described_class.new(amount, user, order) }

  describe '#create' do
    it 'creates a Stripe PaymentIntent' do
      payment_intent = double('Stripe::PaymentIntent')
      allow(Stripe::PaymentIntent).to receive(:create).and_return(payment_intent)

      result = service.create

      expect(Stripe::PaymentIntent).to have_received(:create).with(
        amount: amount,
        automatic_payment_methods: { enabled: true },
        capture_method: 'manual',
        currency: 'gbp',
        customer: 'cus_RO4kYXL8E8Symo',
        metadata: { order_id: 1, order_items: '[]', store_id: store.id, user_id: user.id },
        receipt_email: user.email,
        setup_future_usage: 'off_session'
      )
      expect(result).to eq(payment_intent)
    end
  end

  describe '#update' do
    let(:payment_intent_id) { 'pi_123' }

    it 'updates a Stripe PaymentIntent' do
      payment_intent = double('Stripe::PaymentIntent')
      allow(Stripe::PaymentIntent).to receive(:update).and_return(payment_intent)

      result = service.update(payment_intent_id)

      expect(Stripe::PaymentIntent).to have_received(:update).with(
        payment_intent_id,
        {
          amount: amount,
          currency: 'gbp',
          receipt_email: 'test@example.com'
        }
      )
      expect(result).to eq(payment_intent)
    end
  end
end
