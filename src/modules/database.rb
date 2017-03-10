require 'sequel'
require 'sqlite3'

module Bot
  # Database module for bot
  module Database
    # Connect to database
    DB = Sequel.connect('sqlite://botfiles/data.db')

    # Load migrations
    Sequel.extension :migration
    Sequel::Migrator.run(DB, 'src/modules/database/migrations')

    # Load models
    Dir['src/modules/database/*.rb'].each { |mod| load mod }
  end
end
