module Bot
  module Commands
    # Command Name
    module Treasure
      extend Discordrb::Commands::CommandContainer
      command(
        :tr,
        help_available: false,
        permission_level: 1
      ) do |_event, option, id, *text|
        text = text.join(' ')
        Database::CommandLog.resolve_name('Treasure').log
        if option == 'n'
          Database::Treasure.resolve_id(id).update name: text
        elsif option == 'd'
          Database::Treasure.resolve_id(id).update description: text
        elsif option == 'l'
          Database::Treasure.resolve_id(id).add_location Database::Location.resolve_name(text)
        elsif option == 'm'
          Database::Treasure.resolve_id(id).add_material Database::Material.resolve_name(text)
        elsif option == 'i'
          Database::Treasure.resolve_id(id).update image: text
        end
      end
    end
  end
end
