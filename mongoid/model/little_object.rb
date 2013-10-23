#encoding: UTF-8
require 'mongoid'

class LittleObject
  include Mongoid::Document
  field :name
  field :first_name
  field :address
  field :post_code, type: Integer
  field :city

  def self.random
    obj=LittleObject.new
    obj.name = SecureRandom.base64(12)
    obj.first_name = SecureRandom.base64(15)
    obj.address = SecureRandom.base64(18)
    obj.post_code = SecureRandom.random_number(9000)+1000
    obj.city = SecureRandom.base64(12)
    obj
  end
end