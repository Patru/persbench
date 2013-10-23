#encoding: UTF-8
require 'mongoid'
$:.unshift File.dirname(__FILE__)

Mongoid.configure do |config|
  name = "mongoid_test_db"
  host = "localhost"
  port = 27017
  config.connect_to("db_test")
end
