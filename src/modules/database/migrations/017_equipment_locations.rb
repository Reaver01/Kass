Sequel.migration do
  up do
    create_table(:equipment_locations) do
      primary_key :id
      foreign_key :equipment_id, :equipment
      foreign_key :location_id, :locations
    end
  end

  down do
    drop_table(:equipment_locations)
  end
end
