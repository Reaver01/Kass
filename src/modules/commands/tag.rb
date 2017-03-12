module Bot
  module Commands
    # Command Name
    module Tag
      extend Discordrb::Commands::CommandContainer
      command(
        [:tag, :t],
        description: 'displays a created tag',
        usage: 'tag <name> || tag create/edit <name> <contents> || tag delete <name> || tag overr' \
          'ide <name> <contents>'
      ) do |event, *args|
        Database::CommandLog.resolve_name('Tag').log
        if args[0] == 'create'
          if Database::Tag.resolve_name(args[1]).tag_message.nil?
            message = event.message.content.gsub!(/.*?(?=create)/im, '')
            message.slice!(0..(7 + args[1].length))
            Database::Tag.resolve_name(args[1]).update_tag message
            Database::Tag.resolve_name(args[1]).update_owner event.user.id
            Database::Tag.resolve_name(args[1]).tag_message
          else
            owner = BOT.user(Database::Tag.resolve_name(args[1]).owner_id).name
            "A tag for #{args[1]} already exists. It is owned by #{owner}."
          end
        elsif args[0] == 'edit'
          if Database::Tag.resolve_name(args[1]).owner_id == event.user.id
            message = event.message.content.gsub!(/.*?(?=edit)/im, '')
            message.slice!(0..(5 + args[1].length))
            Database::Tag.resolve_name(args[1]).update_tag message
            Database::Tag.resolve_name(args[1]).tag_message
          elsif Database::Tag.resolve_name(args[1]).tag_message.nil?
            message = args.last args.size - 2
            Database::Tag.resolve_name(args[1]).update_tag message
            Database::Tag.resolve_name(args[1]).tag_message
          else
            "You can't edit someone else's tag."
          end
        elsif args[0] == 'delete'
          if Database::Tag.resolve_name(args[1]).owner_id == event.user.id
            Database::Tag.resolve_name(args[1]).remove_tag
            'The tag has been removed.'
          else
            unless Database::Tag.resolve_name(args[1]).owner_id.nil?
              "You can't delete someone else's tag."
            end
          end
        elsif args[0] == 'list'
          Database::Tag.each { |tag| event << tag.tag_name if event.user.id == tag.owner_id }
        else
          unless Database::Tag.resolve_name(args[0]).tag_message.nil?
            Database::Tag.resolve_name(args[0]).tag_message
          end
        end
      end
    end
  end
end
