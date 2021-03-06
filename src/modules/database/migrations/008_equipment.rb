Sequel.migration do
  up do
    create_table(:equipment) do
      primary_key :id
      Integer :item_id
      String :name
      String :description
      Integer :property, default: 0
      string :image
    end
  end

  down do
    drop_table(:equipment)
  end
end
