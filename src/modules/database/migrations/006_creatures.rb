Sequel.migration do
  up do
    create_table(:creatures) do
      primary_key :id
      Integer :item_id
      String :name
      String :description
      Integer :hearts, default: 0
      string :image
    end
  end

  down do
    drop_table(:creatures)
  end
end
