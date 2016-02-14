class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.references :survey #this reference should be singular

      t.timestamps
    end
  end
end
