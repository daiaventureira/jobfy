class AddStatusToProjectApplication < ActiveRecord::Migration[6.1]
  def change
    add_column :project_applications, :status, :integer, default: 5
  end
end
