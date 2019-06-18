class Player < ActiveRecord::Base

    def create_review(player)
        puts "#{player.name}, Please create your review. First, what game are you reviewing?"
        game_name = gets.chomp
        puts "Please write what you thought about this game."
        review_content = gets.chomp
        puts "Please put a rating for this game (1-10)"
        review_rating = gets.chomp
        new_review = Review.create(player_id: player.id,game_id: game_name, text: review_content, rating: review_rating)
        puts "Review created! Returning to main menu"
        main_menu(player)
    end

    def my_reviews(player)
        binding.pry
        # puts "Here are all reviews: #{Review.all}"
        puts "Here are all reviews authored by you(#{player.name}): #{Review.all.select do |review|
            review.player_id == player.id     
        end}"
        puts "Return to main menu? Y/N"
        if gets.chomp =~ /[yY]/
            main_menu(player)
        end 
    end

    def find_my_review_by_game_name
        puts "Please enter the name of the game you want to find the review for."
        game_name = gets.chomp
        my_reviews.find_by(game.name == game_name)
    end

    def update_review #SEE Pages document
        #find review from own reviews (my_reviews)
        #Look at review's @game attribute (game object)
        #See if the game_name argument matches the game object's @name attribute
        game_review_to_change = my_reviews.find_by(game.name == game_name) #review to update
        game_review_to_change.update(content: new_content) 
    end

    def delete_review
        puts "Please choose the review to delete by entering the name of the game."
        
        game_name = gets.chomp
        
        game_review_to_delete = my_reviews.find_by(game.name == game_name)

        if game_review_to_delete == nil
            puts "No game by that name found in your reviews. Please try again."
            #How to try again? Recursion?
        else 
          game_review_to_delete.destroy
        end
    end

    def delete_all_reviews
        puts "Are you sure you want to delete all reviews? Y/N"
        if gets.chomp =~ /[yY]/
            puts "All reviews deleted."
            my_reviews.destroy_all #clear? But that would just delete array, not objs?
        elsif gets.chomp =~ /[nN]/
            nil #go back to main menu?
        end
    end

    def see_all_reviews_for_game
        puts "Please enter the name of the game you would like to see all the reviews for."
        game_name = gets.chomp
        
        #Look thru all reviews, see if any of their Game obj's @name == game_name
        #first, get all game objects (Review.all_games)
        #if Review.all_games.any? {|game| game.name == game_name} <-- is there any game with that name?
        #    Review.all.select {|review| review.game.name: game_name} <--Select all reviews whose @game(obj)'s @name = game_name
        #else 
        # puts "No reviews found for a game named #{game_name}.Try again? Type Y for yes, type any other key to exit to main menu."
        #   if gets.chomp=~ /[yY]/
        #      see_all_reviews_for_game
        #   else
        #      #go back to main menu
        #      main_menu
        #   end 
        #      
        #         
        #end
    end


end
