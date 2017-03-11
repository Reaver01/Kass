Sequel.migration do
  up do
    create_table(:creatures_materials) do
      primary_key :id
      foreign_key :creature_id, :creatures
      foreign_key :material_id, :materials
    end
  end

  down do
    drop_table(:creatures_materials)
  end
end
