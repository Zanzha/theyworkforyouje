class Proposition < ApplicationRecord
 belongs_to :politician
 has_many :votes
##### proposition wont insert when has_many :votes is used,   show vote doesnt work with it removed.?


  def self.search(query)
    if query.blank?  # blank? covers both nil and empty string
      all
    else
      where('prop_name LIKE ? OR lodged_by LIKE ?', "%#{query}%", "%#{query}%")
    end
  end
end