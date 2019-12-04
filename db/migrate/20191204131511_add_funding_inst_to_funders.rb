class AddFundingInstToFunders < ActiveRecord::Migration[5.2]
  def change
    add_reference :funders, :funding_inst, foreign_key: true
  end
end
