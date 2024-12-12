// app/javascript/controllers/element_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    var stripe = Stripe(this.element.dataset.publishedKey);

    const elements = stripe.elements({
      clientSecret: this.element.dataset.stripeElementsClientSecret
    })

    let paymentElement = elements.create('payment', {
      layout: {
        type: 'accordion',
        defaultCollapsed: false
      }
    })

    paymentElement.mount('#payment-element')
  }
}