class Vote < ApplicationRecord
  belongs_to :politician
<<<<<<< HEAD
  has_one :proposition

  paginates_per 10
=======
  belongs_to :proposition
>>>>>>> develop
end 