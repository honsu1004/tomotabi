class CreateChecklistItems < ActiveRecord::Migration[7.2]
  def change
    create_table :checklist_items do |t|
      t.references :plan, null: false, foreign_key: true
      t.boolean :is_checked

      t.timestamps
    end
  end
end
