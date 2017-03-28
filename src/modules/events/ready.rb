module Bot
  module Events
    # Ready event
    module Ready
      extend Discordrb::EventContainer
      ready do |_event|
        # Set game text
        BOT.game = 'the Accordian'

        # Tell the console BOT is ready
        puts 'BOT Ready!'
      end
    end
  end
end
