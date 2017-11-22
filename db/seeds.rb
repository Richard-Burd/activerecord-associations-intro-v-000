Artist.create(name: "Mozart")
Artist.create(name: "Brahms")
Artist.create(name: "Lizst")

Genre.create(name: "Classical")
Genre.create(name: "Chamber")
Genre.create(name: "Folk")

Song.create(name: "Sonata in F Major", artist_id: 1, genre_id: 1)
Song.create(name: "Concerto in C Minor", artist_id: 1, genre_id: 1)
Song.create(name: "Figero", artist_id: 2, genre_id: 2)
Song.create(name: "Alegro", artist_id: 2, genre_id: 1)
Song.create(name: "Waltz", artist_id: 2, genre_id: 3)
