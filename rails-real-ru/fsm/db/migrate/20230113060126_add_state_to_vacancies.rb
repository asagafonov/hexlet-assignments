class AddStateToVacancies < ActiveRecord::Migration[7.0]
  def change
    add_column :vacancies, :state, :string
  end
end
