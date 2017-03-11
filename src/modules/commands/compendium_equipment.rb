module Bot
  module Commands
    # Command Name
    module Equipment
      extend Discordrb::Commands::CommandContainer
      command(
        :eq,
        help_available: false,
        permission_level: 1
      ) do |_event, option, id, *text|
        text = text.join(' ')
        Database::CommandLog.resolve_name('Equipment').log
        if option == 'n'
          Database::Equipment.resolve_id(id).update name: text
        elsif option == 'd'
          Database::Equipment.resolve_id(id).update description: text
        elsif option == 'l'
          Database::Equipment.resolve_id(id).add_location Database::Location.resolve_name(text)
        elsif option == 'e'
          Database::Equipment.resolve_id(id).add_effect Database::Effect.resolve_name(text)
        elsif option == 'p'
          Database::Equipment.resolve_id(id).update property: text.to_i
        elsif option == 'i'
          Database::Equipment.resolve_id(id).update image: text
        end
      end
    end
  end
end
