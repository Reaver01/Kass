Sequel.migration do
  up do
    create_table(:permissions) do
      primary_key :id
      Integer :discord_id
      Integer :level, default: 0
    end
  end

  down do
    drop_table(:permissions)
  end
end
