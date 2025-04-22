class CreateWebhookLog < ActiveRecord::Migration[8.0]
  def change
    create_table :webhook_logs do |t|
      t.string :event_params
      t.timestamps
    end
  end
end
