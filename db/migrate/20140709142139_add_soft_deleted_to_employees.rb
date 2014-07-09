class AddSoftDeletedToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :soft_deleted, :boolean, default: false
  end
end
