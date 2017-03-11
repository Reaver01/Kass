module Bot
  module Database
    # Player table
    class Effect < Sequel::Model
      many_to_many :creatures
      many_to_many :materials

      def self.resolve_name(effect_name)
        find_or_create(name: effect_name)
      end
    end
  end
end
