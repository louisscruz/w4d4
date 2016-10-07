class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :body, null: false
      t.references :taggable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
