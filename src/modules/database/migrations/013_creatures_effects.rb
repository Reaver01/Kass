Sequel.migration do
  up do
    create_table(:creatures_effects) do
      primary_key :id
      foreign_key :creature_id, :creatures
      foreign_key :effect_id, :effects
    end
  end

  down do
    drop_table(:creatures_effects)
  end
end
