class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :domain
      t.string :category
      t.date :start_date

      t.timestamps
    end
  end
end
