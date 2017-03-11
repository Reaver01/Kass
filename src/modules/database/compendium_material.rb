require 'titleize'

module Bot
  module Database
    # Player table
    class Material < Sequel::Model
      many_to_many :creatures
      many_to_many :effects
      many_to_many :locations
      many_to_many :monsters
      many_to_many :treasures

      def self.resolve_name(mat_name)
        find_or_create(name: mat_name)
      end

      def self.resolve_id(id)
        find_or_create(item_id: id)
      end

      def info_embed
        embed = Discordrb::Webhooks::Embed.new
        embed.title = "#{item_id} #{name.titleize}"
        embed.thumbnail = { url: image }
        embed.description = ''
        embed.description += "**Description**\n#{description}\n" unless description.nil?
        unless locations.length.zero?
          embed.description += "**Common Locations**\n"
          locations.each { |l| embed.description += "#{l.name.titleize}\n" }
        end
        embed.description += "**Hearts Recovered**\n#{hearts.round(2)}\n" unless hearts.zero?
        unless effects.length.zero?
          embed.description += "**Cooking Effects**\n"
          effects.each { |e| embed.description += "#{e.name.titleize}\n" }
        end
        embed.timestamp = Time.now
        embed
      end
    end
  end
end
