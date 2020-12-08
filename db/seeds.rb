Review.destroy_all
Movie.destroy_all
Viewer.destroy_all

# 20.times do
#     Viewer.create(name:Faker::Name.name)
# end

# 20.times do
#     Movie.create(title:Faker::Movie.title, genre:Faker::Book.genre, release_date:Faker::Number.number(digits: 4))
# end

# 20.times do
#     Review.create(title:Faker::Movie.title, rating:Faker::Number.within(range: 1..5), fave_scene:Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4), movie_id: Movie.all.sample.id, viewer_id: Viewer.all.sample.id)
# end

v1 = Viewer.create(name: "Ursala")
v2 = Viewer.create(name: "Billy-Bob")
v3 = Viewer.create(name: "Sally")
v4 = Viewer.create(name: "John")
v5 = Viewer.create(name: "Pearl")


m1 = Movie.create(title: "Titanic", genre: "Romance", release_date: 1997)
m2 = Movie.create(title: "The Lion King", genre: "Animation", release_date: 1994)
m3 = Movie.create(title: "The Dark Knight", genre: "Fantasy", release_date: 2008)
m4 = Movie.create(title: "Avengers: Endgame", genre: "Adventure", release_date: 2019)
m5 = Movie.create(title: "The Sound of Music", genre: "Musical", release_date: 1965)
m6 = Movie.create(title: "Spider-Man 3", genre: "Action/Adventure", release_date: 2007)
m7 = Movie.create(title: "Catwoman", genre: "Action", release_date: 2004)
m8 = Movie.create(title: "Breakfast at Tiffany's", genre: "Romance", release_date: 1961)
m9 = Movie.create(title: "White Christmas", genre: "Musical", release_date: 1954)

r1 = Review.create(rating: 5, fave_scene: "When the musicians play one last time together.", movie_id: Movie.find_by(name: "Titanic"), viewer_id: Viewer.all.sample.id)
r2 = Review.create(rating: 5, fave_scene: "When Simba grows up during Hakuna Matata.", movie_id: Movie.find_by(name: "The Lion King"), viewer_id: Viewer.all.sample.id)
r3 = Review.create(rating: 4, fave_scene: "When Joker blows up the bus.", movie_id: Movie.find_by(name: "The Dark Knight"), viewer_id: Viewer.all.sample.id)
r4 = Review.create(rating: 3, fave_scene: "When Black Panther appears!! Wakanda Forever!", movie_id: Movie.find_by(name: "Avengers: Endgame"), viewer_id: Viewer.all.sample.id)
r5 = Review.create(rating: 5, fave_scene: "When Maria and the Captain gets married.", movie_id: Movie.find_by(name: "The Sound of Music"), viewer_id: Viewer.all.sample.id)
r6 = Review.create(rating: 2, fave_scene: "Sandman's and Spiderman's fight scene.", movie_id: Movie.find_by(name: "Spider-Man 3"), viewer_id: Viewer.all.sample.id)
r7 = Review.create(rating: 2, fave_scene: "Catwoman's fight scene.", movie_id: Movie.find_by(name: "Catwoman"), viewer_id: Viewer.all.sample.id)
r8 = Review.create(rating: 4, fave_scene: "Cat in the rain scene.", movie_id: Movie.find_by(name: "Breakfast at Tiffany's"), viewer_id: Viewer.all.sample.id)
r9 = Review.create(rating: 3, fave_scene: "Final singing scene with all the red costumes.", movie_id: Movie.find_by(name: "White Christmas"), viewer_id: Viewer.all.sample.id)

puts 'great job Ange'