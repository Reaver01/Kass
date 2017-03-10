Sequel.migration do
  up do
    create_table(:roles) do
      primary_key :id
      Integer :role_id
      TrueClass :user_can_add, default: false
      TrueClass :added_by_default, default: false
    end
  end

  down do
    drop_table(:roles)
  end
end
