Review.destroy_all
Movie.destroy_all
Viewer.destroy_all

20.times do
    Viewer.create(name:Faker::Name.name)
end

20.times do
    Movie.create(title:Faker::Movie.title, genre:Faker::Book.genre, release_date:Faker::Number.number(digits: 4))
end

20.times do
    Review.create(rating:Faker::Number.within(range: 1..5), fave_scene:Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4), movie_id: Movie.all.sample.id, viewer_id: Viewer.all.sample.id)
end

puts 'great job Ange'