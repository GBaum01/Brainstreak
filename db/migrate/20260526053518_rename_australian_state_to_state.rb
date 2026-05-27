class RenameAustralianStateToState < ActiveRecord::Migration[7.1]
  def change
    rename_column :students, :australian_state, :state
  end
end
