require 'titleize'

module Bot
  module Commands
    # Command Name
    module Compendium
      extend Discordrb::Commands::CommandContainer
      command(
        :comp,
        description: 'Search something within the Hyrule Compendium. Must be spelled correctly. C' \
          'ase insensitive.',
        usage: 'comp mat/loc item to be searched'
      ) do |event, option, *search|
        search = search.join(' ').downcase
        Database::CommandLog.resolve_name('Compendium').log
        if option == 'mat'
          similar = Database::Material.where(Sequel.ilike(:name, "#{search}%"))
          if similar.count.zero?
            'Item not found.'
          elsif similar.count == 1
            event.channel.send_embed 'I found this in the Hyrule Compendium:', similar[0].info_embed
          else
            event << 'Perhaps one of these is what you are looking for:'
            similar.each { |m| event << m.name.titleize }
            nil
          end
        end
        if option == 'loc'
          similar = Database::Location.where(Sequel.ilike(:name, "#{search}%"))
          if similar.count.zero?
            'Location not found.'
          elsif similar.count == 1
            embed = Discordrb::Webhooks::Embed.new
            embed.title = similar[0].name.titleize
            embed.thumbnail = { url: similar[0].image }
            embed.description = ''
            unless similar[0].materials.length.zero?
              embed.description += "**Materials**\n"
              similar[0].materials.each do |m|
                embed.description += "\##{m.item_id} - #{m.name.titleize}\n"
              end
            end
            embed.timestamp = Time.now
            event.channel.send_embed 'I found this in the Hyrule Compendium:', embed
          else
            event << 'Perhaps one of these is what you are looking for:'
            similar.each { |m| event << m.name.titleize }
            nil
          end
          end
        end
      end
    end
  end
end
