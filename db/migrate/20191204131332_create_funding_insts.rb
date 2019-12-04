class CreateFundingInsts < ActiveRecord::Migration[5.2]
  def change
    create_table :funding_insts do |t|
      t.string :name
      t.text :about
      t.string :website
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
