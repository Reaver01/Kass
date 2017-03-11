Sequel.migration do
  up do
    create_table(:locations) do
      primary_key :id
      String :name
      String :description
      string :image
    end
  end

  down do
    drop_table(:locations)
  end
end
