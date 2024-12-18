// app/javascript/controllers/element_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.stripe = Stripe(this.element.dataset.publishedKey);

    this.elements = this.stripe.elements({
      clientSecret: this.element.dataset.stripeElementsClientSecret,
      customerSessionClientSecret: this.element.dataset.customerSessionClientSecret,

    })

    let paymentElement = this.elements.create('payment', {
      layout: {
        type: 'accordion',
        defaultCollapsed: false
      }
    })

    paymentElement.mount('#payment-element')
  }

  confirmPaymentIntent() {
    const elements = this.elements;
    this.stripe.confirmPayment({
      elements,
      confirmParams: {
        return_url: 'http://localhost:3000/payments',
      },
    })
  }

  confirmSetupIntent() {
    const elements = this.elements;

    this.stripe.confirmSetup({
      elements,
      confirmParams: {
        return_url: 'http://localhost:3000/payment_method',
        payment_method_data: {
          allow_redisplay: 'always',
        },
      },
    })
      .then(function (result) {
        if (result.error) {
          // Inform the customer that there was an error.
        }
      });
  }
}