class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :question
      t.references :answer
      t.references :taker

      t.timestamps
    end
  end
end
