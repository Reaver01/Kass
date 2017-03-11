Sequel.migration do
  up do
    create_table(:materials_treasures) do
      primary_key :id
      foreign_key :material_id, :materials
      foreign_key :treasure_id, :treasures
    end
  end

  down do
    drop_table(:materials_treasures)
  end
end
