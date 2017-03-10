# Used to send reminders via dm
def reminder_dm(time, id, tag, message)
  Bot::SCHEDULER.at time, tags: [id.to_s, tag] do
    begin
      Bot::BOT.user(id).pm(message)
    rescue
      puts 'Sending reminder DM failed'
    end
  end
end

# Used to send reminders via a channel
def reminder_channel(time, channel, tag, message)
  Bot::SCHEDULER.at time, tags: [channel.to_s, tag] do
    begin
      Bot::BOT.channel(channel).send_temporary_message message, 60
    rescue
      puts 'Sending reminder to channel failed'
    end
  end
end
