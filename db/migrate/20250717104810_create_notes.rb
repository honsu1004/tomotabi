class CreateNotes < ActiveRecord::Migration[7.2]
  def change
    create_table :notes do |t|
      t.references :plan, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content

      t.references :updated_user, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
