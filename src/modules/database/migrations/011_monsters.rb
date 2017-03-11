Sequel.migration do
  up do
    create_table(:monsters) do
      primary_key :id
      Integer :item_id
      String :name
      String :description
      string :image
    end
  end

  down do
    drop_table(:monsters)
  end
end
