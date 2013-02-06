#encoding: UTF-8
require "securerandom"

class LittleObject
  attr_accessor :name, :first_name, :address, :post_code, :city

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