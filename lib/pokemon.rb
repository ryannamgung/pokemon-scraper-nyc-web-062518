require "pry"
class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(pokemon_array)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(num, db)
    poke_instance = db.execute("SELECT * FROM pokemon WHERE id = ?", num)
    pokemon = self.new(poke_instance)
    # binding.pry
    pokemon.id = poke_instance[0][0]
    pokemon.name = poke_instance[0][1]
    pokemon.type = poke_instance[0][2]
    return pokemon
  end

end
