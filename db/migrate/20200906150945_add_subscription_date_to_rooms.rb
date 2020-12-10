class AddSubscriptionDateToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :subscription_date, :date
    add_column :rooms, :subscription_message, :text
  end
end
