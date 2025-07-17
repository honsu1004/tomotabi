class CreateScheduleItems < ActiveRecord::Migration[7.2]
  def change
    create_table :schedule_items do |t|
      t.references :plan, null: false, foreign_key: true
      t.integer :day_number
      t.string :address
      t.decimal :latitude
      t.decimal :longitude

      t.references :updated_user, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
