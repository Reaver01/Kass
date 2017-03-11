module Bot
  module Commands
    # Command Name
    module Material
      extend Discordrb::Commands::CommandContainer
      command(
        :mat,
        help_available: false,
        permission_level: 1
      ) do |_event, option, id, *text|
        text = text.join(' ')
        Database::CommandLog.resolve_name('Material').log
        if option == 'n'
          Database::Material.resolve_name(text).update item_id: id
        elsif option == 'd'
          Database::Material.resolve_id(id).update description: text
        elsif option == 'l'
          Database::Material.resolve_id(id).add_location Database::Location.resolve_name(text)
        elsif option == 'e'
          Database::Material.resolve_id(id).add_effect Database::Effect.resolve_name(text)
        elsif option == 'h'
          Database::Material.resolve_id(id).update hearts: text.to_i
        elsif option == 'i'
          Database::Material.resolve_id(id).update image: text
        end
      end
    end
  end
end
