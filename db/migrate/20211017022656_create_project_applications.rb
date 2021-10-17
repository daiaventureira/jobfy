class CreateProjectApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :project_applications do |t|
      t.string :introduction
      t.references :project, null: false, foreign_key: true
      t.references :professional, null: false, foreign_key: true

      t.timestamps
    end
  end
end
