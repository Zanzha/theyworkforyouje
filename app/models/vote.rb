class Vote < ApplicationRecord
  belongs_to :politician
 # belongs_to :proposition
  has_one :proposition
end 