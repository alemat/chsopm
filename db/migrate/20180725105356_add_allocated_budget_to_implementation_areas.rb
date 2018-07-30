class AddAllocatedBudgetToImplementationAreas < ActiveRecord::Migration[5.2]
  def change
    add_column :implementation_areas, :allocated_budget, :string
  end
end
