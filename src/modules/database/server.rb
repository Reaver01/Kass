module Bot
  module Database
    # Player table
    class Server < Sequel::Model
      def self.resolve_id(id)
        find_or_create(server_id: id)
      end

      def toggle_welcome_message
        status = has_welcome_message
        if status
          update(has_welcome_message: false)
          false
        else
          update(has_welcome_message: true)
          true
        end
      end

      def change_welcome_message(message)
        update(welcome_message: message)
      end
    end
  end
end
