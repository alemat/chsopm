class AddCurrencyToFunders < ActiveRecord::Migration[5.2]
  def change
    add_column :funders, :currency, :string
  end
end
