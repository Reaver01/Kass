module Bot
  module Commands
    # Command Module
    module LeaveRole
      extend Discordrb::Commands::CommandContainer
      command(
        :leave,
        description: 'Leave a joinable role.',
        usage: 'leave <role_name>',
        min_args: 1
      ) do |event, *role_name|
        Database::CommandLog.resolve_name('Leave').log
        role_name = role_name.join(' ')
        server_role = event.server.roles.find { |role| role.name == role_name }
        if server_role.nil?
          "The role #{role_name} does not exist on the server."
        elsif Database::Role.resolve_id(server_role.id).user_can_add
          event.user.remove_role(server_role)
          "You have been added to #{role_name}."
        else
          "#{role_name} cannot be joined."
        end
      end
    end
  end
end
