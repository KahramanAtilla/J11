 require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

  def accueil
    puts "-------------------------------------------------"
    puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
    puts "|Le but du jeu est d'être le dernier survivant !|"
    puts "-------------------------------------------------"
  end

  def orch
  ## creation joueur
    puts "Choisissez votre pseudo"
    l = gets.chomp
    j1 = HumanPlayer.new(l)

  ## creation ennemies
    ennemies = []
    ennemies << player1 = Player.new("Josianne")
    ennemies << player2 = Player.new("Jose")

   # exec
    while j1.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
      j1.show_state
      puts " "
      puts "Quelle action veux-tu effectuer ?

	a - chercher une meilleure arme
	s - chercher à se soigner

	attaquer un joueur en vue :
	0 - Josiane a #{player1.life_points} points de vie
	1 - José a #{player2.life_points} points de vie"

	u = gets.chomp
	if u == "a"
	  j1.search_weapon
	  puts " "
	elsif u == "s"
	  j1.search_health_pack
	  puts " "
	elsif u == "0"
	  j1.attacks(player1)
	  puts " "
	elsif u == "1"
	  j1.attacks(player2)
	  puts " "
	end
	if player1.life_points > 0 || player2.life_points > 0
	  puts "Les autres joueurs t'attaquent !\n"
	end

	ennemies.each do |c|
	  if c.life_points > 0
	    c.attacks(j1)
	  end
	end
	
    end
    if j1.life_points > 0
      puts "BRAVO ! TU AS GAGNE !\n"
    else
      puts "Loser ! Tu as perdu !\n"
    end
end

  def perform
    accueil
    orch
  end

perform

    
