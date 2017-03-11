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
        embed.thumbnail = {
          url: image
        }
        embed.description = "**Description**\n#{description}" \
          "**Common Locations**\n"
        locations.each { |l| embed.description += "#{l.name.titleize}\n" }
        embed.timestamp = Time.now
        embed
      end
    end
  end
end
