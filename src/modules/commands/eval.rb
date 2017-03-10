module Bot
  module Commands
    # Command Name
    module Eval
      extend Discordrb::Commands::CommandContainer
      command(
        [:eval, :e],
        description: 'Evaluates code',
        usage: 'eval <code>',
        help_available: false,
        permission_level: 999
      ) do |event, *code|
        Database::CommandLog.resolve_name('Eval').log
        begin
          result = eval code.join(' ')
          begin
            event.channel.send_embed do |e|
              e.description = result.to_s
              e.color = 0x00ff00
            end
          rescue
            puts "Result from eval was too long to send:\n#{result}"
          end
        rescue => error
          begin
            event.channel.send_embed do |e|
              e.color = 0xff0000
              e.description = "```#{error}```"
              e.author = {
                name: 'An error occurred!',
                icon_url: 'http://emojipedia-us.s3.amazonaws.com/cache/f4/63/f463408675b9437b457915713b9af46c.png'
              }
              e.add_field(
                name: 'Backtrace',
                value: "```#{error.backtrace.join("\n")}```"
              )
            end
          rescue
            puts "Error from eval was too long to send:\n#{error}"
          end
        end
      end
    end
  end
end
