class CreateMemories < ActiveRecord::Migration[7.2]
  def change
    create_table :memories do |t|
      t.references :memory_folder, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :url
      t.datetime :uploaded_at

      t.references :updated_user, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
