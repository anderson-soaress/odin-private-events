class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :local
      t.datetime :date

      t.timestamps
    end
  end
end
