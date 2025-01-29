class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.date :start_date
      t.string :duration
      t.date :end_date

      t.timestamps
    end
  end
end
