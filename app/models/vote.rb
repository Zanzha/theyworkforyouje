class Vote < ApplicationRecord
  belongs_to :politician
  has_one :proposition

  paginates_per 10
end 