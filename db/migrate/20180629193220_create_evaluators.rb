class CreateEvaluators < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluators do |t|
      t.references :evaluation, foreign_key: true
      t.string :full_name
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
