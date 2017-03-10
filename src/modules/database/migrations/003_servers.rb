Sequel.migration do
  up do
    create_table(:servers) do
      primary_key :id
      Integer :server_id
      TrueClass :has_welcome_message, default: false
      String :welcome_message, default: ''
    end
  end

  down do
    drop_table(:servers)
  end
end
