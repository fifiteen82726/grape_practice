class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :post

      t.timestamps null: false
    end
  end
end
