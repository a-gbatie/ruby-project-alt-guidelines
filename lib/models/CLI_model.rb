class CommandLineInterface 

    def greet
        puts 'Welcome to uSEEit, the best movie review site in the whole universe!'
    end

    def user_input
        puts "Need help picking something for movie night? We got you!"
        puts "Enter what genre you're in the mood for, or, if you already have a title in mind we'll show you the reviews on it: "

        input = gets.chomp()
        g_result = Movie.find_by(genre: input)
        if g_result 
            puts "#{input}? Great choice! Here are our top rated #{input} movies!" 
            puts Movie.top_rated(input).each {|m| puts m.title}
        elsif
        t_result = Movie.find_by(title: input)
            puts "#{input}? Awesome pick! Here is what our other members had to say about it."
        else
            puts "We're sorry, we can't find that selection."
        end
    end

end

