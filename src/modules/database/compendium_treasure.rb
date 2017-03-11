module Bot
  module Database
    # Player table
    class Treasure < Sequel::Model
      many_to_many :locations
      many_to_many :materials

      def self.resolve_id(id)
        find_or_create(item_id: id)
      end
    end
  end
end
