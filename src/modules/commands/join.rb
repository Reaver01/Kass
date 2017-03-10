module Bot
  module Commands
    # Command Module
    module JoinRole
      extend Discordrb::Commands::CommandContainer
      command(
        :joinable,
        description: 'Join a joinable role.',
        usage: 'join <role_name>',
        min_args: 1
      ) do |event, *role_name|
        Database::CommandLog.resolve_name('Join').log
        role_name = role_name.join(' ')
        server_role = event.server.roles.find { |role| role.name == role_name }
        if server_role.nil?
          "The role #{role_name} does not exist on the server."
        elsif Database::Role.resolve_id(server_role.id).user_can_add
          event.user.add_role(server_role)
          "You have been added to #{role_name}."
        else
          "#{role_name} cannot be joined."
        end
      end
    end
  end
end
