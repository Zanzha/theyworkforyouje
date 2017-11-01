class Politician < ApplicationRecord
  #has_many :terms
  # has_many :propositions
  #  has_many :votes

  def self.search(query)
    puts 'Search'
    if query.blank?  # blank? covers both nil and empty string
      all
    else
      where('full_name LIKE ?', "%#{query}%")
    end
  end

end