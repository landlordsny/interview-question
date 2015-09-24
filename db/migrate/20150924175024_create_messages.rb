class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :user
      t.text :body, nil: false
      t.datetime :read_at

      t.timestamps null: false
    end
  end
end
