module Bot
  module Commands
    # Command Module
    module DefaultRole
      extend Discordrb::Commands::CommandContainer
      command(
        :default,
        description: 'Toggle a role to be a role that users are automatically added to',
        usage: 'default <role_name>',
        min_args: 1,
        required_permissions: [:administrator],
        permission_message: 'Only an admin can use %name%'
      ) do |event, *role_name|
        Database::CommandLog.resolve_name('Default').log
        role_name = role_name.join(' ')
        server_role = event.server.roles.find { |role| role.name == role_name }
        if server_role.nil?
          "The role #{role_name} does not exist on the server. Please create it first."
        elsif Database::Role.resolve_id(server_role.id).toggle_default
          "Users will now be added to #{role_name} when they join this server."
        else
          "Users will no longer be added to #{role_name} when they join this server."
        end
      end
    end
  end
end
