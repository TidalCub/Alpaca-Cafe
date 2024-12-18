class AddPaymentIntentToOrder < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :payment_intent, :string
    add_column :orders, :client_secret, :string
  end
end
