Sequel.migration do
  up do
    create_table(:effects_materials) do
      primary_key :id
      foreign_key :effect_id, :effects
      foreign_key :material_id, :materials
    end
  end

  down do
    drop_table(:effects_materials)
  end
end
