class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :summary
      t.integer :year
      t.integer :pages

      t.timestamps
    end
  end
end
