class AddFieldsToContribution < ActiveRecord::Migration
  def change
    add_column :contributions, :accepted, :boolean
  end
end
