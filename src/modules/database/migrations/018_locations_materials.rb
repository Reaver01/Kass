Sequel.migration do
  up do
    create_table(:locations_materials) do
      primary_key :id
      foreign_key :location_id, :locations
      foreign_key :material_id, :materials
    end
  end

  down do
    drop_table(:locations_materials)
  end
end
