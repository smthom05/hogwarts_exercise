class CreateMemberTable < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.integer :member_id

      t.timestamps
    end
  end
end
