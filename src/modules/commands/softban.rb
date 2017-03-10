module Bot
  module Commands
    # Command Module
    module SoftBan
      extend Discordrb::Commands::CommandContainer
      command(
        :softban,
        description: 'Kick a user and remove their message history',
        usage: 'welcome',
        required_permissions: [:kick_members],
        permission_message: 'Only someone who can already kick a user can use %name%'
      ) do |event, mention|
        Database::CommandLog.resolve_name('SoftBan').log
        user = BOT.parse_mention(mention)
        if user.nil?
          # Do nothing
        else
          event.channel.history(100).each do |message|
            message.delete if message.author.id == user.id
          end
          event.server.kick(user)
          "#{user.name} got rekt"
        end
      end
    end
  end
end
