require 'bundler/setup'
require 'discordrb'
require 'discordrb/data'
require 'dotenv'
require 'fileutils'
require 'rufus-scheduler'
require 'easy_translate'

# The main bot module
module Bot
  # Load SCHEDULER
  SCHEDULER = Rufus::Scheduler.new

  # Load helpers
  Dir['src/helpers/*.rb'].each { |file| load file }

  # Make botfiles directory if it doesn't exist
  Dir.mkdir('botfiles') unless File.exist?('botfiles')

  # Set Prefix
  PREFIX = ':'.freeze

  # Set Translate API key
  EasyTranslate.api_key = ENV['TRANSLATE']

  # Load Modules
  Dir['src/modules/*.rb'].each { |file| load file }

  # Load the environment variables
  Dotenv.load

  # Load the bot as a constant
  BOT = Discordrb::Commands::CommandBot.new client_id: ENV['CLIENT'],
                                            token: ENV['TOKEN'],
                                            prefix: PREFIX,
                                            advanced_functionality: false,
                                            ignore_bots: true

  # Set permissions
  BOT.set_user_permission(ENV['OWNER'].to_i, 999)

  # Load all command modules
  Dir['src/modules/commands/*.rb'].each { |mod| load mod }
  Commands.constants.each { |mod| BOT.include! Commands.const_get mod }

  # Load all event modules
  Dir['src/modules/events/*.rb'].each { |mod| load mod }
  Events.constants.each { |mod| BOT.include! Events.const_get mod }

  # Run bot
  BOT.run
end
