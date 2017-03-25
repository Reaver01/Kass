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
        if %w(creatures creature creat).any? { |o| option.include?(o) }
          similar = Database::Creature.where(Sequel.ilike(:name, "%#{search}%"))
          if similar.count.zero?
            'Creature not found.'
          elsif similar.count == 1 || similar.all[0].name == search
            event.channel.send_embed 'I found this in the Hyrule Compendium:',
                                     similar.all[0].info_embed
          elsif similar.count > 1
            event << 'Perhaps one of these is what you are looking for:'
            similar.each { |m| event << m.name.titleize }
            nil
          end
        elsif %w(materials material mats mat).any? { |o| option.include?(o) }
          similar = Database::Material.where(Sequel.ilike(:name, "%#{search}%"))
          if similar.count.zero?
            'Item not found.'
          elsif similar.count == 1 || similar.all[0].name == search
            event.channel.send_embed 'I found this in the Hyrule Compendium:',
                                     similar.all[0].info_embed
          elsif similar.count > 1
            event << 'Perhaps one of these is what you are looking for:'
            similar.each { |m| event << m.name.titleize }
            nil
          end
        elsif %w(locations location locs loc).any? { |o| option.include?(o) }
          similar = Database::Location.where(Sequel.ilike(:name, "%#{search}%"))
          if similar.count.zero?
            'Location not found.'
          elsif similar.count == 1 || similar.all[0].name == search
            embed = Discordrb::Webhooks::Embed.new
            embed.title = similar.all[0].name.titleize
            embed.thumbnail = { url: similar.all[0].image }
            embed.description = ''
            unless similar.all[0].creatures.length.zero?
              embed.description += "**Creatures**\n"
              similar.all[0].creatures.each do |m|
                embed.description += "\##{m.item_id} - #{m.name.titleize}\n"
              end
            end
            unless similar.all[0].materials.length.zero?
              embed.description += "**Materials**\n"
              similar.all[0].materials.each do |m|
                embed.description += "\##{m.item_id} - #{m.name.titleize}\n"
              end
            end
            embed.timestamp = Time.now
            event.channel.send_embed 'I found this in the Hyrule Compendium:', embed
          elsif similar.count > 1
            event << 'Perhaps one of these is what you are looking for:'
            similar.each { |m| event << m.name.titleize }
            nil
          end
        end
      end
    end
  end
end
