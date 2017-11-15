class Parish < ApplicationRecord
#  has_many :terms
  has_many :politicians

  def parish_desc
      if parish.name == 'Saint Helier'
        puts 'St Helier has a population of about 33,500, roughly 34.2% of the total population of Jersey, and is the capital of the Island (although Government House is situated in St Saviour). The urban area of the parish of St Helier makes up most of town, although some of the town area is situated in adjacent St Saviour, with suburbs sprawling into St Lawrence and St Clement. The greater part of St Helier is rural.

        The parish covers a surface area of 4.1 square miles (10.6 km2), being 9% of the total land area of the Island (this includes reclaimed land area of 494 acres (2.00 km2) or 200 ha).

        Saint[edit]

        Saint Helier is named for Helier (or Helerius), a 6th-century ascetic hermit. The traditional date of his martyrdom is AD 555. His feast day, marked by an annual municipal and ecumenical pilgrimage to the Hermitage, is on 16 July.'
      elsif parish.name == 'Grouville'
        return 'GR'
      else
        'Parish description'
      end
    end
end
