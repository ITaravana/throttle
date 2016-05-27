class User < ActiveRecord::Base
  
  	include Clearance::User
    
    has_many :reservations 
    has_many :vehicles
    has_many :authentications, :dependent => :destroy

    mount_uploader :pic, ImageUploader2

  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.first_name = auth_hash["info"]["name"]
      u.email = auth_hash["extra"]["raw_info"]["email"] || "#{auth_hash["info"]["name"]}@tempmail.com"
      u.pic = auth_hash["info"]["image"]
      u.password = SecureRandom.hex(6)
      u.authentications<<(authentication)
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

  # def cart_total_price
  # total_price = 0
  # get_cart_reservations.each { |reservation| total_price += reservation.total_price }
  # total_price
  # end

  # def get_cart_reservations
  #   cart_ids = $redis.smembers "cart#{id}"
  #   Reservation.find(cart_ids)
  # end

  # def purchase_cart_reservations!
  #   get_cart_reservations.each { |reservation| purchase(reservation) }
  #   $redis.del "cart#{id}"
  # end

  def purchase(reservation)
    reservations << reservation unless purchase?(reservation)
  end

  def purchase?(reservation)
    reservations.include?(reservation)
  end

end
