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
                    password: "123456password",
                    type: "Admin")

puts "Created #{kemo.username}"

star_trek = Review.create!(title: "Star Trek",
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

   puts "review for #{star_trek.title} was created"

the_mandalorian = Review.create!(title: "The Mandalorian",
                            content: "The Mandalorian is a Star Wars story that takes place after the fall of the Empire and before the emergence of the First Order. The series follows the travails of a lone gunfighter in the outer reaches of the galaxy far from the authority of the New Republic.",
                            category: "movies & tv",
                            subtitle: "The Mandalorian: The Best Star Wars Show Since The Clone Wars",
                            user: kemo)
puts "review for #{the_mandalorian.title} was created"



Comment.create!(content: "cool review",
                            c_nickname: "jane398",
                            review: star_trek)


Comment.create!(content: "I love this show!",
                            c_nickname: "filmboy2",
                            review: star_trek)

Comment.create!(content: "sick review my man!",
                c_nickname: "f40927",
                review: the_mandalorian)


# second user creation

maddy = User.create!(email: "maddy@gmail.com",
                    username: "madz",
                    first_name: "mikkle",
                    last_name: "Alvarez",
                    password: "itsapassword1",
                    type: "Admin")

puts "Created #{maddy.username}"

tar = Review.create!(title: "tar",
                    category: "movies & tv",
                    subtitle: "A woman alone",
                    content: "Set during the captaincy of Christopher Pike, who preceded Captain Kirk aboard the U.S.S. Enterprise, this prequel to Star Trek: The Original Series is an episodic,
                    character-driven thrill ride where each hour pairs a top notch sociological story with some good, clean, swashbuckling fun. So much about the series just works, from its stellar
                    cast to its nostalgic but breathable grip on Trek lore, but what elevates Strange New Worlds from other streaming sci-fi is its insistence on sweetness and silliness. Keep your multiverses,
                    your convoluted tragic backstories, your hyper-serialized storytelling about the end of the universe as we know it—I’ll take my sci-fi with a heaping side of hijinks.
                    It’s important to note that hijinks are an integral part of Star Trek’s DNA. For all its visionary ideas about collectivism, justice, and inclusivity, Star Trek has always been
                    a deeply silly sandbox where Starfleet officers tumble into campy misadventures in between all the phaser fire. Who could forget the iconic Original Series episode when the Enterprise is overrun with furry, fast-procreating tribbles,
                    or the Voyager banger where aliens mistake a virtual reality show for real life? These aren’t mere throwaway episodes—they’re earnest, empathetic, slice-of-life stories that air out the drafty starships with some much-needed sunlight.
                    The franchise’s signature spirit of optimism would be diminished without them.",
                    user: maddy)

puts "review for #{tar.title} was created"

the_whale = Review.create!(title: "The Whale",
                    content: "After watching The Whale, observing its reverent reception at the Venice
                    film festival and beyond, and following Aronofsky’s ongoing press tour in which he repeatedly insists that his film is in service to fat people, generously “humanising” us, I have to say: wow, ha ha, OK, no.",
                    category: "movies & tv",
                    subtitle: "worst award bait ever",
                    user: maddy)
puts "review for #{the_whale.title} was created"


Comment.create!(content: "I agree- terrible movie",
                c_nickname: "emmybait",
                review: the_whale)

Comment.create!(content: "depressing",
                c_nickname: "emmybait",
                review: the_whale)


Comment.create!(content: "As a professional fat person I can tell you that people in general are incapable of seeing any fat person as an individual, and as a professional film critic I can tell you that if The Whale didn’t reflect and validate society’s real opinion of fat people, there’s no way society would like The Whale this much. There’s very little entertainment in it. It is not fun or funny or sweet
                or deep or beautifully written or illuminating. It sucks to watch and it is very, very silly.",
                c_nickname: "whalewatcher",
                review: the_whale)

Comment.create!(content: "The Whale is not a real fat person telling their own raw story with all the complexities and contradictions of lived experience. Charlie is a fictional character created by a thin person, a fantasy of fat squalor, a confirmation that we “do this” to ourselves: that we gorge buckets of chicken like mindless beasts, that we never see the world,
                never let the sun warm our bodies, never step into the sea, never make art, never feel human touch, never truly live. Portrayals like this steal from us in two directions: we are denied both the freedom to enjoy food and to have complicated relationships with it. I suppose my criticism boils down to this: a fat person, even one with a life identical to Charlie’s,
                could never have made The Whale. It is fundamentally not of us and therefore incurably untrue.",
                c_nickname: "F-1-49",
                review: the_whale)

Comment.create!(content: "she has cool fits tho",
                c_nickname: "kaleP",
                review: tar)

Comment.create!(content: "what about the ending though",
                c_nickname: "drew",
                review: tar)
