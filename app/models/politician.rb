class Politician < ApplicationRecord
  has_many :propositions
  has_many :votes
<<<<<<< HEAD
  belongs_to :parish
end
=======

  def self.search(query)
    if query.blank?  # blank? covers both nil and empty string
      all
    else
      where('full_name LIKE ?', "%#{query}%")
    end
  end
end
>>>>>>> a4c146ea28078b07a0d61625e88cbf7591b5e20c
