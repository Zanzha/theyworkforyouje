class Parish < ApplicationRecord
#  has_many :terms
  has_many :politicians

  def parish_desc
      if self.name == 'Saint Helier'
        "St Helier has a population of about 33,500, roughly 34.2% of the total population of Jersey, and is the capital of the Island (although Government House is situated in St Saviour). The urban area of the parish of St Helier makes up most of town, although some of the town area is situated in adjacent St Saviour, with suburbs sprawling into St Lawrence and St Clement. The greater part of St Helier is rural.

        The parish covers a surface area of 4.1 square miles (10.6 km2), being 9% of the total land area of the Island (this includes reclaimed land area of 494 acres (2.00 km2) or 200 ha).
        Saint Helier is the most populated of Jerseys' parishes, with 33,522 residents according to the 2011 census.
        With the Constable, the parish therefore has 11 representatives in the States of Jersey (out of 53 elected members).
        The Parish also has its own responsibilities and elections to the Municipality of St Helier take place to elect honorary officials who fulfill a variety of roles for Parishioners under the overall control of the Constable, two Procureurs du Bien Public and the Parish Assembly."
      elsif self.name == 'Grouville'
        'Grouville is in the south east of the island and is dominated by the broad sweep of the Royal Bay of Grouville. The parish covers a surface area of 4,354 vergées (7.8 km²). It borders Saint Clement, Saint Saviour and Saint Martin.
        Population: 4,866 (2011)'
      elsif self.name == 'Saint Brelade'
        'Saint Brélade population is around 9,560, and it occupies the southwestern part of the island. It is the only parish to border only one other parish, Saint Peter. The parish is the second-largest parish by surface area, covering 7,103 vergées (3,157 acres or 12.78 km²), which is 11% of the total land surface of the island.
        Its name is derived from a 6th-century Celtic or Welsh "wandering saint" named Branwalator or Saint Brelade (also Branwallder, Broladre, Brelodre, Brélade), who is said to have been the son of the Cornish king, Kenen. He is also said to have been a disciple of Samson of Dol, and worked with this churchman in Cornwall and the Channel Islands. A large section of the Jersey Railway linking La Corbière with Saint Helier ran through the parish between 1870 and 1936.
        Saint Brélade has some of the most popular bays in Jersey, with Saint Brélades Bay, Ouaisné, Portelet and parts of both Saint Ouens Bay and Saint Aubins Bay falling within the parish boundaries. The village (or town) of Saint Aubin was originally a fishing port facing Saint Helier on the opposite side of Saint Aubins Bay. Saint Aubin was historically the main centre of population in the parish, but residential development at Les Quennevais has shifted that centre of population.'
      elsif self.name == 'Saint Clement'
        'Saint Clement (Jèrriais: St Cliément) is in the south east of the Island, and contains some of the suburbs of Saint Helier. It is the smallest parish by surface area, but the second most densely populated.  Saint Clement stretches west to east from Le Dicq to within a quarter mile of La Rocque harbour (at the end of Rue de la Lourderie). Its surface area is around 1,044 acres (4.22 km2).
        Aside from the two deputies who sit in the States of Jersey and represent the parish, Saint Clement also has its own local administration. This, like each of the other eleven parishes, is made up of a Connétable (often referred to as the "father" of the parish), who is elected for a three-year term and has a seat in the States Chamber, and on the Comité des Connétables; two Procureurs du Bien Public, who are also elected and oversee the finances of the parish; a Recteur (or Rector), responsible for the parish church; members of the parish Honorary Police (made up of Centeniers, Vingteniers and Constables Officers); and other officers such as churchwardens, roads inspectors, rates assessors and a registrar.
        Population	9,221 (2011).'
      elsif self.name == 'Saint John'
        'Saint John shares borders with Saint Mary on its west, Trinity to the east, and Saint Lawrence and Saint Helier on its south.
        The cliffs of the north coast afford some of the best views in Jersey. After Trinity, it has the second highest point in Jersey at Mont Mado (473 ft). The parish covers territory of 4,846 vergées (8.7 km².).
        The Centre Stone at Sion in St. John is traditionally regarded as the centre of the Island although it is far from the geographic centre by modern calculations. The stone is prehistoric, showing evidence of cup marks, and may have been brought from a nearby dolmen now vanished.
        Population 2,911 (2011).'
      elsif self.name == 'Saint Lawrence'
        'Saint Lawrence (Jèrriais: St Louothains). The parish covers 5,258 vergées (9.5 km², (3.7 sq mi)) and occupies the centre of the Island.
        Much of the parish is inland, though it has a short stretch of coastline in Saint Aubins Bay. It borders Saint Peter and Saint Mary to the west, Saint John to the north and east, and Saint Helier to the east.
        Including the Connétable, the parish has three elected representatives in the States of Jersey.
        Area	9.5 km2
        Population	5,418 (2011).'
      elsif self.name == 'Saint Martin'
        'Saint Martin (Jèrriais: St Martîn). Historically it was called "Saint Martin le Vieux" to distinguish it from the present day parish of Grouville.
        Saint Martin is the only parish in Jersey not to conduct its municipal business from a Parish Hall. Saint Martin has a Public Hall instead, having accepted money from the States of Jersey to provide an assembly room.
        This is one of the most agricultural parishes, and one of the most sought after places to live in the island. It has the best herd of Jersey cattle, some of the largest potato growers and a number of small farmers now cultivating the new “Genuine Jersey”, mainly organic, brand.
        Area 10.3 km2 (4.0 sq mi)
        Density	370/km2 (950/sq mi)
        Population	3,763 (2011)'
      elsif self.name == 'Saint Mary'
        'Saint Mary (Jèrriais: Sainte Mathie). It is situated in the north west and covers an area of 3,604 vergées (6.5 km²).
        It borders four other parishes: Saint Ouen, Saint John, Saint Peter and Saint Lawrence. The parish and its eponymous church derive their name from a medieval monastery, probably destroyed during Viking raids some time between the 8th and 10th centuries. In 1042 Duke William gave "Saint Mary of the Burnt Monastery" to the abbey of Cerisy.
        Population 1,752 (2011)
        Density	270/km2 (700/sq mi)'
      elsif self.name == 'Saint Ouen'
        'Saint Ouen (Jèrriais: Saint Ouën). It is in the north west of Jersey. The parish is the largest parish by surface area, covering 8,341 vergées (15 km²).
        It is reputed to be the most traditional of the parishes, being the farthest from Saint Helier and with much of the territory of the parish forming a peninsula. Its manor, Saint Ouens Manor has been the seat of the de Carteret family for over eight centuries.
        The traditional nickname for St. Ouennais is Gris Ventres (grey bellies) - a reference to the custom of men from the parish to wear jerseys of undyed wool, which distinguished them from men from other parishes who generally wore blue.
        Area	15 km2 (6 sq mi)
        Population	4,097 (2011)
        Density	270/km2 (710/sq mi).'
      elsif self.name == 'Saint Peter'
        'Saint Peter (Jèrriais: St Pièrre) is in the west central part of the island. It is the only parish with two separate coastlines, stretching from Saint Ouens Bay in the west to Saint Aubins Bay in the south, and thereby cutting Saint Brelade off from other parishes. The parish is the fourth-largest parish by surface area, covering 6,469 vergées (11.6 km2 (4.5 sq mi).
        It borders four other parishes.
        The traditional nickname for St. Pierrais is ventres à baînis (limpet bellies), perhaps because their parish sticks to two coasts like limpets.
        Area 11.6 km2 (4.5 sq mi)
        Population 5,003 (2011)
        Density	430/km2 (1,100/sq mi).'
      elsif self.name == 'Saint Saviour'
        'Saint Saviour (Jèrriais: St Saûveux/St Sauveur) has a land surface area of 3.6 square miles (9.3 km2), borders with five other parishes and has a very small coastline at Le Dicq.
        Total area	9.3 km2 (3.6 sq mi)
        Population	13,580 (2011)
        Density	1,500/km2 (3,800/sq mi).'
      elsif self.name == 'Trinity'
        'Trinity (French: La Trinité, Jèrriais: La Trinneté) is located the north east of the island.
        Trinity has the reputation of being the most rural of Jerseys parishes, being the third-largest parish by surface area with the third-smallest population. The parish covers 6,817 vergées (12.3 km2 (4.7 sq mi)). It is home to the States Farm, the Durrell Wildlife Park at Les Augrès Manor, the headquarters of the Royal Jersey Agricultural and Horticultural Society at the Royal Jersey Showground, and the Pallot Heritage Steam Museum.
        Total area	12.3 km2 (4.7 sq mi)
        Population 3,156 (2011)
        Density	260/km2 (660/sq mi).'
      elsif self.name == 'Island Wide'
        'Senators represent the whole Island. All 8 Senators are elected for the same term of office as the Constables and Deputies.  Deputies are elected in 17 districts which correspond to parish boundaries. Larger parishes are divided u​p into more than 1 district to make sure the population is represented (e.g. St Helier and St Brelade).'
      else
        'Parish'
      end
    end
end
