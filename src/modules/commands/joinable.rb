module Bot
  module Commands
    # Command Module
    module JoinableRole
      extend Discordrb::Commands::CommandContainer
      command(
        :joinable,
        description: 'Toggle a role to be a role that users can add themselves to',
        usage: 'joinable <role_name>',
        min_args: 1,
        required_permissions: [:administrator],
        permission_message: 'Only an admin can use %name%'
      ) do |event, *role_name|
        Database::CommandLog.resolve_name('Joinable').log
        role_name = role_name.join(' ')
        server_role = event.server.roles.find { |role| role.name == role_name }
        if server_role.nil?
          "The role #{role_name} does not exist on the server. Please create it first."
        elsif Database::Role.resolve_id(server_role.id).toggle_user_can_add
          "Users will now be able to add or remove themselves to/from #{role_name}."
        else
          "Users will no longer be able to add or remove themselves to/from #{role_name}."
        end
      end
    end
  end
end
