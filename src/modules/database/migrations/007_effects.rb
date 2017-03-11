Sequel.migration do
  up do
    create_table(:effects) do
      primary_key :id
      String :name
      String :description
      string :image
    end
  end

  down do
    drop_table(:effects)
  end
end
