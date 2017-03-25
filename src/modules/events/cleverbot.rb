module Bot
  module Events
    # Message event
    module Message
      extend Discordrb::EventContainer
      message do |event|
        unless event.message.content.include?(PREFIX)
          if event.message.channel.pm?
            event.channel.start_typing
            sleep rand(1..3)
            event.respond CLEVERBOT.say(event.message.content, event.user)
          else
            unless BOT.parse_mention(
              event.message.content
            ).nil? || event.channel.default?
              if BOT.parse_mention(
                event.message.content
              ).id == ENV['CLIENT']
                text = event.message.content.delete("<@#{ENV['CLIENT']}>")
                event.channel.start_typing
                sleep rand(1..3)
                event.respond CLEVERBOT.say(text, event.user)
              end
            end
          end
        end
      end
    end
  end
end
