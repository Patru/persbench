require 'active_record'
require 'sqlite3'
require 'logger'

ActiveRecord::Base.logger = Logger.new('debug.log')
config_file_name = File.join(File.dirname(__FILE__), "db", "config.yml")
ActiveRecord::Base.configurations = YAML::load(IO.read(config_file_name))
ActiveRecord::Base.establish_connection('development')
