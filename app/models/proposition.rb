class Proposition < ApplicationRecord
 # belongs_to :politician
#  has_many :votes

  def search(query)
    if query.blank?  # blank? covers both nil and empty string
      all
    else
      where('prop_name LIKE ?', "%#{query}%")
    end
  end
end