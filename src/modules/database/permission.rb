module Bot
  module Database
    # Player table
    class Permission < Sequel::Model
      def self.resolve_id(id)
        find_or_create(discord_id: id)
      end
    end
  end
end
