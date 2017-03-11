Sequel.migration do
  up do
    create_table(:materials_monsters) do
      primary_key :id
      foreign_key :material_id, :materials
      foreign_key :monster_id, :monsters
    end
  end

  down do
    drop_table(:materials_monsters)
  end
end
