module Bot
  module Commands
    # Command Module
    module Welcome
      extend Discordrb::Commands::CommandContainer
      command(
        :wmessage,
        description: 'Set server welcome message',
        usage: 'wmessage <message>',
        required_permissions: [:administrator],
        permission_message: 'Only an admin can use %name%'
      ) do |event, *message|
        message = message.join(' ')
        Database::CommandLog.resolve_name('Welcome Message').log
        Database::Server.resolve_id(event.server.id).change_welcome_message(message)
        'The servers welcome message has been set.'
      end
    end
  end
end
