class Proposition < ApplicationRecord
 # belongs_to :politician
  has_many :votes
  belongs_to :votes
end