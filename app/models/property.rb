class Property < ActiveRecord::Base

  belongs_to :city
  has_many :comments, through: :users


  def home_info
    "#{self.address}, #{self.city_name}, CO."
  end

  def apartment_info
    "#{self.address}, Unit: #{self.apt_number}, #{self.city_name}, CO."
  end

end
