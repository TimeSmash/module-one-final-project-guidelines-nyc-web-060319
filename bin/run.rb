require_relative "../config/environment"
require_relative "../app/models/game.rb"

def start
  puts 'Please submit your username or create a new account. To create a new account, type "new".'
  # input = gets.chomp
  # if input == "new"
  #   login
  # end
end

def login
  input = gets.chomp
  if input == "new"
    puts "Please choose a username"
    new_username = gets.chomp
    player = Player.create(name: new_username)
    main_menu(player)
  else
    Player.all.each do |player|
      if input == player.name
        main_menu(player)
        # user = Player.all.find_by(name: input)
        # main_menu(user)
        #
      else
        puts "Invalid username. Please try again or create a new account."
      end
    end
  end
end

def main_menu(player)
  #main_menu(user)
  #user = Player.all.find_by(name: input) from before
  puts "Welcome #{player.name}! What would you like to do?"
  puts ""
  puts "[1] Add a new game"
  puts "[2] Create new game review"
  puts "[3] See all of my reviews"
  puts "[4] Find a review by game"
  puts "[5] Exit"

  choice = gets.chomp
  main_menu_action(choice,player)
end

def main_menu_action(choice,player)
  #need to somehow have choice == 
  case choice
  when "1" #instantiates new game
    # Game.create?
  when "2" #instantiate new review
    # puts "Choice 2 pass"
    player.create_review(player)
  when "3" #shows all of user's reviews
    player.my_reviews(player)
  when "4"
    #find review by name
  when "5"
    puts "Goodbye, #{player.name}!"
    exit
  end
end

def review_menu
  puts "What would you like to do?"
  puts ""
  puts "[1] Update this review"
  puts "[2] Delete this review"
  puts "[3] Exit to main menu"

  choice = gets.chomp
  review_menu_action(choice)
end

def review_menu_action
  case input
  when "1" #update
  when "2" # delete
  when "3"
    main_menu
  end
end
Review.all.destroy_all
start
login
main_menu