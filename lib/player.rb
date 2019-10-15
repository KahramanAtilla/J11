require 'pry'

class Player
  attr_accessor :name, :life_points
  @@all_players = []

  def initialize(name)
    @name = name
    @life_points = 10
    @@all_players << self
  end

  def self.allp
    return @@all_players
  end

  def show_state
    puts " #{@name} have #{@life_points} hp"
  end

  def gets_damage(i)
    @life_points -= i
      if @life_points <= 0
        puts "#{@name} has been slain"
      end
    return nil
  end

  def compute_damage
    return rand(1..6)
  end

  def attacks(pl2)
    defense = pl2.name
    puts "#{name} attacks #{defense}"
    pl2.gets_damage(compute_damage.to_i)
  end
end
