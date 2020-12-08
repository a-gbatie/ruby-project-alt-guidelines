require 'tty-prompt'
class CommandLineInterface 

    def greet
        puts 'Welcome to uSEEit, the best movie review site in the whole universe!'
        puts "Let's start out with your name."
        new_name = gets.chomp()

        valid = Viewer.find_by(name: new_name)
        if valid 
            @user = valid
            where_to_go
        else
            @user = Viewer.create(name: new_name)
            p "Nice to meet you #{new_name}!"
            where_to_go
        end
    end

    def initialize
        @prompt = TTY::Prompt.new
    end

    def where_to_go
        user_input = @prompt.select( "What do you want to do next?", [
            "Look for a movie",
            "Create a review",
            "Update a review",
            "Delete a review",
            "Quit"
        ])
        
        case user_input
        when "Look for a movie"
            puts main_screen()
        when "Create a review"
            make_a_review()
        when "Update a review"
            update_a_review()
        when "Delete a review"
            delete_a_review()
        when "Quit"
            puts greet
        end
    end

    def main_screen()
        puts "Hey #{new_name}, need help picking something for movie night? We got you!"
        puts "Enter what genre you're in the mood for, or, if you already have a title in mind we'll show you the reviews on it: "

        input = gets.chomp()
        g_result = Movie.find_by(genre: input)
        if g_result 
            puts "#{input}? Great choice! Here are our top rated #{input} movies!" 
            Movie.top_rated(input).each {|m| puts m.title}
        elsif
        t_result = Movie.find_by(title: input)
            puts "#{input}? Awesome pick! Here is what our other members had to say about it."
            Review.get_review(input)
        else
            puts "We're sorry, we can't find that selection."
        end
    end

    # Review.all.each do |review| 
    #         puts "movie: #{review.movie.title} id: #{review.movie_id}"
    #         puts "rating: #{review.rating}"
    #         puts "favorite scene: #{review.fave_scene}"
    #         puts ""
    #     end

    def make_a_review()
        puts "Here are all your reviews."
        puts ""
        Review.all.map do |review| 
            puts "ID: #{review.movie_id} Title: #{review.movie.title}"
            puts ""
        end 

        puts "Let's create a review! What is the title of the movie?"
        title = gets.chomp()
        movie = Movie.find_by(title: title)

        if !movie
            puts "Looks like this movie doesn't exist yet, let's create one."
            puts "Please re-enter the movie title."
            title = gets.chomp()
        else
            Movie.find_by(title: title) == true
            puts "This movie already exists! Please enter a new title or exit."
            user_input = @prompt.select( "What do you want to do next?", [
            "Enter a new movie title",
            "Quit"
        ])
            case user_input
            when "Enter a new movie title"
                puts !movie
            when "Quit"
                puts greet
            end

            puts "Please enter the genre."
            genre = gets.chomp()
            puts "Please enter the release date."
            release_date = gets.chomp()
            movie = Movie.create(title: title, genre: genre, release_date: release_date)
        end

        puts "#{title}? Perfect! Out of 1 - 5 what rating would you give #{title}?"
        rating = gets.chomp()

        puts "Okay, #{rating} out of 5. Now lastly, what was your favorite scene from #{title}?"
        scene = gets.chomp()

        puts "Wonderful! You've successfully created a review for #{title}. You gave it a #{rating} out of 5, & your favorite scene is when #{scene}."
        Review.create(rating: "#{rating}", fave_scene: "#{scene}", movie_id: movie.id, viewer_id: @user.id)
    end

    def update_a_review
        Review.all.each do |review| 
            puts "movie: #{review.movie.title} id: #{review.id}"
            puts "rating: #{review.rating}"
            puts "favorite scene: #{review.fave_scene}"
            puts ""
        end

        puts "Which movie would you like to update? Please enter movie id."
        input = gets.chomp()

        get_movie = Review.find(input)
        puts "To update the rating please enter new rating between 1 - 5"
        input1 = gets.chomp()
        get_movie.update(rating: input1)
        puts "Great! Your rating has been updated!"
    end

    def delete_a_review
        Review.all.each do |review| 
            puts "movie: #{review.movie.title} id: #{review.movie_id}"
            puts "rating: #{review.rating}"
            puts "favorite scene: #{review.fave_scene}"
            puts ""
        end

        puts "Which review would you like to delete? Please enter movie id."
        input = gets.chomp()

        get_movie = Review.find(input)
        puts "Please verify that you want to proceed"
        input1 = gets.chomp()

        if input1 == "Yes"
            Review.destroy(input)
            puts "Okay, movie id:#{input} has been deleted."
        else
            greet
        end
    end
end
