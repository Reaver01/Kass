Sequel.migration do
  up do
    create_table(:locations_monsters) do
      primary_key :id
      foreign_key :location_id, :locations
      foreign_key :monster_id, :monsters
    end
  end

  down do
    drop_table(:locations_monsters)
  end
end
