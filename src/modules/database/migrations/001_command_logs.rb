Sequel.migration do
  up do
    create_table(:command_logs) do
      primary_key :id
      String :command_name
      Integer :count, default: 1
      DateTime :last_used, default: Time.now
    end
  end

  down do
    drop_table(:command_logs)
  end
end
