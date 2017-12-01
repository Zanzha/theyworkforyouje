class Proposition < ApplicationRecord
# belongs_to :politician
 has_many :votes

  def self.search(query)
    if query.blank?  # blank? covers both nil and empty string
      all
    else
      where('prop_name LIKE ? OR lodged_by LIKE ?', "%#{query}%", "%#{query}%")
    end
  end
end