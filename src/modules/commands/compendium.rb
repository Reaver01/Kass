require 'titleize'

module Bot
  module Commands
    # Command Name
    module Compendium
      extend Discordrb::Commands::CommandContainer
      command(
        :comp,
        description: 'Search something within the Hyrule Compendium. Must be spelled correctly. Case insensitive.',
        usage: 'comp mat/loc item to be searched'
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
        if option == 'loc'
          found_location = Database::Location.find(name: search)
          if found_location.nil?
            'Location not found.'
          else
            embed = Discordrb::Webhooks::Embed.new
            embed.title = found_location.name.titleize
            embed.thumbnail = { url: found_location.image }
            embed.description = ''
            unless found_location.materials.length.zero?
              embed.description += "**Materials**\n"
              found_location.materials.each do |m|
                embed.description += "\##{m.item_id} - #{m.name.titleize}\n"
              end
            end
            embed.timestamp = Time.now
            event.channel.send_embed 'I found this in the Hyrule Compendium:', embed
          end
        end
      end
    end
  end
end
