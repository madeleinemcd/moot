# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

kemo = User.create!(email: "kemoquaquin@gmail.com",
                    username: "momo",
                    first_name: "Kemo",
                    last_name: "Alvarez",
                    password: "123456")

puts "Created #{kemo.username}"

dummy_data = Review.create!(title: "Star Trek",
                             category: "movies & tv",
                             subtitle: "The Newest Series: Flop or Final Frontier",
                             content: "Set during the captaincy of Christopher Pike, who preceded Captain Kirk aboard the U.S.S. Enterprise, this prequel to Star Trek: The Original Series is an episodic,
                             character-driven thrill ride where each hour pairs a top notch sociological story with some good, clean, swashbuckling fun. So much about the series just works, from its stellar
                             cast to its nostalgic but breathable grip on Trek lore, but what elevates Strange New Worlds from other streaming sci-fi is its insistence on sweetness and silliness. Keep your multiverses,
                             your convoluted tragic backstories, your hyper-serialized storytelling about the end of the universe as we know it—I’ll take my sci-fi with a heaping side of hijinks.
                             It’s important to note that hijinks are an integral part of Star Trek’s DNA. For all its visionary ideas about collectivism, justice, and inclusivity, Star Trek has always been
                            a deeply silly sandbox where Starfleet officers tumble into campy misadventures in between all the phaser fire. Who could forget the iconic Original Series episode when the Enterprise is overrun with furry, fast-procreating tribbles,
                            or the Voyager banger where aliens mistake a virtual reality show for real life? These aren’t mere throwaway episodes—they’re earnest, empathetic, slice-of-life stories that air out the drafty starships with some much-needed sunlight.
                            The franchise’s signature spirit of optimism would be diminished without them.",
                             user: kemo)

   puts "#{dummy_data.id} was created"

   dummy_data1 = Review.create!(title: "The Mandalorian",
                                content: "The Mandalorian is a Star Wars story that takes place after the fall of the Empire and before the emergence of the First Order. The series follows the travails of a lone gunfighter in the outer reaches of the galaxy far from the authority of the New Republic.",
                                category: "movies & tv",
                                subtitle: "The Mandalorian: The Best Star Wars Show Since The Clone Wars",
                                user: kemo)
  puts "#{dummy_data1.id} was created"



   comments = Comment.create!(content: "damn you're a great writer",
                              c_nickname: "bobbyboy1",
                              review: dummy_data)


  comments2 = Comment.create!(content: "I love this show",
                              c_nickname: "yoboysno",
                              review: dummy_data)
