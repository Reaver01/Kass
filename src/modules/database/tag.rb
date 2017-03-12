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
        update(tag_name: nil, owner_id: nil)
      end
    end
  end
end
