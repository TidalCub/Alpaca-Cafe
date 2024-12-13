// app/javascript/controllers/element_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.stripe = Stripe(this.element.dataset.publishedKey);

    this.elements = this.stripe.elements({
      clientSecret: this.element.dataset.stripeElementsClientSecret
    })

    let paymentElement = this.elements.create('payment', {
      layout: {
        type: 'accordion',
        defaultCollapsed: false
      }
    })

    paymentElement.mount('#payment-element')
  }

  confirmSetupIntent() {
    const elements = this.elements;

    this.stripe.confirmSetup({
      elements,
      confirmParams: {
        return_url: 'https://example.com',
        payment_method_data: {
          allow_redisplay: 'always',
        },
      },
    })
    .then(function(result) {
      if (result.error) {
        // Inform the customer that there was an error.
      }
    });
  }
}