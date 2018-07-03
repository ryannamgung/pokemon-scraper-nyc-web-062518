require "pry"
class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(pokemon_hash={})
    # @id = id
    # @name = name
    # @type = type
    # @db = db
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
    pokemon.hp = poke_instance[0][3]
    return pokemon
  end

  # def alter_hp(num, db)
  #   db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", num, self.id)
  #   self.hp = num
  # end
end
