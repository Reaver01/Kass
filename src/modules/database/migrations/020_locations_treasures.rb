Sequel.migration do
  up do
    create_table(:locations_treasures) do
      primary_key :id
      foreign_key :location_id, :locations
      foreign_key :treasure_id, :treasures
    end
  end

  down do
    drop_table(:locations_treasures)
  end
end
