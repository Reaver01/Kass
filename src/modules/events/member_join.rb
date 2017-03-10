module Bot
  module Events
    # Ready event
    module Join
      extend Discordrb::EventContainer
      member_join do |event|
        Database::Role.each do |stored_role|
          server_role = event.server.roles.find { |role| role.id == stored_role.role_id }
          event.user.add_role(server_role) if stored_role.added_by_default
        end
        if Database::Server.resolve_id(event.server.id).has_welcome_message
          event.user.pm Database::Server.resolve_id(event.server.id).welcome_message
        end
      end
    end
  end
end
