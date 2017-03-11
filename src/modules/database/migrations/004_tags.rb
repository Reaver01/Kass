Sequel.migration do
  up do
    create_table(:tags) do
      primary_key :id
      String :tag_name
      Integer :owner_id, default: nil
      String :tag_message, default: nil
    end
  end

  down do
    drop_table(:tags)
  end
end
