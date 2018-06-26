class CreateFunders < ActiveRecord::Migration[5.1]
  def change
    create_table :funders do |t|
      t.references :project, foreign_key: true
      t.references :institution, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
