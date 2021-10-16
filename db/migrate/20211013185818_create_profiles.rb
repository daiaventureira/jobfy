class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.string :social_name
      t.datetime :birth_date
      t.string :educational_background
      t.string :description

      t.timestamps
    end
  end
end
