class RemoveForeignKey < ActiveRecord::Migration[7.0]
  def change
    change_table :orders do |t|
      t.remove_foreign_key :statuses
    end
  end
end
