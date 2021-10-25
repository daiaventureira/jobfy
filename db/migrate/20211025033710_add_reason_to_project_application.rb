class AddReasonToProjectApplication < ActiveRecord::Migration[6.1]
  def change
    add_column :project_applications, :reason, :string
  end
end
