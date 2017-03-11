module Bot
  module Commands
    # Command Name
    module Creature
      extend Discordrb::Commands::CommandContainer
      command(
        :c,
        help_available: false,
        permission_level: 1
      ) do |_event, option, id, *text|
        text = text.join(' ')
        Database::CommandLog.resolve_name('Creature').log
        if option == 'n'
          Database::Creature.resolve_id(id).update name: text
        elsif option == 'd'
          Database::Creature.resolve_id(id).update description: text
        elsif option == 'l'
          Database::Creature.resolve_id(id).add_location Database::Location.resolve_name(text)
        elsif option == 'm'
          Database::Creature.resolve_id(id).add_material Database::Material.resolve_name(text)
        elsif option == 'e'
          Database::Creature.resolve_id(id).add_effect Database::Effect.resolve_name(text)
        elsif option == 'h'
          Database::Creature.resolve_id(id).update hearts: text.to_i
        elsif option == 'i'
          Database::Creature.resolve_id(id).update image: text
        end
      end
    end
  end
end
