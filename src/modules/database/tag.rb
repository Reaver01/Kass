module Bot
  module Database
    # Player table
    class Tag < Sequel::Model
      def self.resolve_name(id)
        find_or_create(tag_name: id)
      end

      def update_tag(message)
        update(tag_message: message)
      end

      def update_owner(id)
        update(owner_id: id)
      end

      def remove_tag
        update(tag_name: '13f58c236c57561845fc')
      end
    end
  end
end
