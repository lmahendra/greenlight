# frozen_string_literal: true

class CreateSharedAccesses < ActiveRecord::Migration[5.2]
  def change
    create_table :shared_accesses do |t|
    	t.integer :room_id
    	t.integer :user_id
      # t.belongs_to :room, foreign_key: true
      # t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
