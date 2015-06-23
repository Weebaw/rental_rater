class Property < ActiveRecord::Base

  belongs_to :city
  has_many :comments

  geocoded_by :home_info
#doesn't recognize geocoded_by

  after_validation :geocode


  def home_info
    "#{self.address}, #{self.city_name}, CO."
  end

  def apartment_info
    "#{self.address}, Unit: #{self.apt_number}, #{self.city_name}, CO."
  end

  def average_rating
    total_comments = self.comments.count
    comments = Comment.where(property_id: self.id).map { |comment| comment.rating }
    comments.inject{ |sum, el| sum + el }.to_f / comments.size
  end



end
