module Bot
  module Database
    # Player table
    class Equipment < Sequel::Model
      many_to_many :locations

      def self.resolve_id(id)
        find_or_create(item_id: id)
      end
    end
  end
end
