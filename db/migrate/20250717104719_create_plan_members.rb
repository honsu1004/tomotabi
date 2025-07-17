class CreatePlanMembers < ActiveRecord::Migration[7.2]
  def change
    create_table :plan_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true
      t.datetime :joined_at

      t.timestamps
    end
  end
end
