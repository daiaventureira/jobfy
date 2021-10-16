class AddProfessionalRefToProfile < ActiveRecord::Migration[6.1]
  def change
    add_reference :profiles, :professional, null: false, foreign_key: true
  end
end
