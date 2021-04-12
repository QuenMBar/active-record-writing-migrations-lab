require 'bundler/setup'
Bundler.require

Dir[File.join(File.dirname(__FILE__), '../app/models', '*.rb')].each { |f| require f }
Dir[File.join(File.dirname(__FILE__), '../lib/support', '*.rb')].each { |f| require f }

ENV['SCHOOL_ENV'] ||= 'development'

DBRegistry[ENV['SCHOOL_ENV']].connect!
DB = ActiveRecord::Base.connection

ActiveRecord::Migration.verbose = false if ENV['SCHOOL_ENV'] == 'test'

def drop_db
    DB.tables.each { |table| DB.execute("DROP TABLE #{table}") }
end
