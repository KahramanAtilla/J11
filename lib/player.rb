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
    puts " #{@name} have #{@life_points} hp et une arme de niveau #{@weapon_level}"
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
    dmg = compute_damage.to_i
    puts "#{dmg} inflige"
    pl2.gets_damage(dmg)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    q = rand(1..6)
    puts "tu as trouve une arme de niveau #{q}"
      if q > @weapon_level
        @weapon_level = q
        puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends"
      else
        puts "M@*#/$... elle n'est pas mieux que ton arme actuelle..."
      end
  end

  def search_health_pack
    q = rand(1..6)
    if q == 1
      puts "Tu n'as rien trouvé..."
    elsif q >= 2 && q <= 5
      @life_points += 50
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else
      @life_points += 80
      puts "Waow, tu as trouvé un pack de +80 points de vie"
    end
  end

end
