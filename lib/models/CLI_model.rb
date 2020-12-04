class CommandLineInterface

    def greet
        puts 'Welcome to uSEEit, the best movie review site in the whole universe!'
    end

    def user_input
        puts "Need help picking something for movie night? We got you!"
        puts "Enter what genre you're in the mood for, or, if you already have a title in mind we'll show you the reviews on it: "
        genre = gets.chomp()
        # title = gets.chomp()

        if genre
            puts "#{genre}? Great choice! Here are our top rated #{genre} movies!" 
            Movie.top_rated(genre)
        end

    end

end
