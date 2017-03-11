module Bot
  module Database
    # Player table
    class Location < Sequel::Model
      many_to_many :creatures
      many_to_many :equipment
      many_to_many :materials
      many_to_many :monsters
      many_to_many :treasures

      def self.resolve_name(loc_name)
        find_or_create(name: loc_name)
      end
    end
  end
end
