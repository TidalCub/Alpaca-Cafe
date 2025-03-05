class CreateMqttLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :mqtt_logs do |t|
      t.string :topic, null: false
      t.text :message
      t.timestamps
      t.index :topic
    end

    add_reference :mqtt_logs, :order, null: true, foreign_key: true
  end
end
