class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :fortune, index: true
      t.string :body
      t.string :author

      t.timestamps
    end
  end
end
