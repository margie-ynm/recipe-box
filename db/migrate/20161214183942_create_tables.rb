class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:ingredients, :string)
      t.column(:instructions, :string)

      t.timestamps()
    end
    create_table(:tags) do |t|
      t.column(:name, :string)

      t.timestamps()
    end
    create_table(:recipes_tags) do |t|
      t.column(:recipe_id, :integer)
      t.column(:tag_id, :integer)

      t.timestamps()
    end
  end
end
