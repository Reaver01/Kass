module Bot
  module Database
    # Player table
    class Role < Sequel::Model
      def self.resolve_id(id)
        find_or_create(role_id: id)
      end

      def toggle_default
        status = added_by_default
        if status
          update(added_by_default: false)
          false
        else
          update(added_by_default: true)
          true
        end
      end
    end
  end
end
