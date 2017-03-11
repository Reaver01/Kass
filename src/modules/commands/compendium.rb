module Bot
  module Commands
    # Command Name
    module Compendium
      extend Discordrb::Commands::CommandContainer
      command(
        :comp
      ) do |event, option, *search|
        search = search.join(' ').downcase
        Database::CommandLog.resolve_name('Compendium').log
        if option == 'mat'
          found_item = Database::Material.find(name: search)
          if found_item.nil?
            'Item not found.'
          else
            event.channel.send_embed 'I found this in the Hyrule Compendium:', found_item.info_embed
          end
        end
      end
    end
  end
end
