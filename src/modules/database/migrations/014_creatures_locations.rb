Sequel.migration do
  up do
    create_table(:creatures_locations) do
      primary_key :id
      foreign_key :creature_id, :creatures
      foreign_key :location_id, :locations
    end
  end

  down do
    drop_table(:creatures_locations)
  end
end
