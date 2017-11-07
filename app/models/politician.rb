class Politician < ApplicationRecord
  #has_many :terms
  has_many :propositions
  has_many :votes
  belongs_to :parish
end
