class Politician < ApplicationRecord
  has_many :propositions
  has_many :votes
  has_many :terms
  belongs_to :parish

  def self.search(query)
    if query.blank?  # blank? covers both nil and empty string
      all
    else
      where('full_name LIKE ?', "%#{query}%")
    end
  end
end