// Create Harry Potter Movies
CREATE 
  (hp1:Movie {title: "Harry Potter and the Philosopher's Stone", released: 2001, tagline: "Let the magic begin", runtime: 152, genre: ["Adventure", "Family", "Fantasy"]}),
  (hp2:Movie {title: "Harry Potter and the Chamber of Secrets", released: 2002, tagline: "Something evil has returned to Hogwarts", runtime: 161, genre: ["Adventure", "Family", "Fantasy"]}),
  (hp3:Movie {title: "Harry Potter and the Prisoner of Azkaban", released: 2004, tagline: "Something wicked this way comes", runtime: 142, genre: ["Adventure", "Family", "Fantasy"]}),
  (hp4:Movie {title: "Harry Potter and the Goblet of Fire", released: 2005, tagline: "Dark and difficult times lie ahead", runtime: 157, genre: ["Adventure", "Family", "Fantasy"]}),
  (hp5:Movie {title: "Harry Potter and the Order of the Phoenix", released: 2007, tagline: "The rebellion begins", runtime: 138, genre: ["Adventure", "Family", "Fantasy"]}),
  (hp6:Movie {title: "Harry Potter and the Half-Blood Prince", released: 2009, tagline: "Dark secrets revealed", runtime: 153, genre: ["Adventure", "Family", "Fantasy"]}),
  (hp7p1:Movie {title: "Harry Potter and the Deathly Hallows - Part 1", released: 2010, tagline: "One way... one fate... one hero", runtime: 146, genre: ["Adventure", "Family", "Fantasy"]}),
  (hp7p2:Movie {title: "Harry Potter and the Deathly Hallows - Part 2", released: 2011, tagline: "It all ends here", runtime: 130, genre: ["Adventure", "Family", "Fantasy"]});

// Create TV Shows  
CREATE
  (breaking:TVShow {title: "Breaking Bad", startYear: 2008, endYear: 2013, seasons: 5, episodes: 62, genre: ["Crime", "Drama", "Thriller"]}),
  (stranger:TVShow {title: "Stranger Things", startYear: 2016, endYear: null, seasons: 4, episodes: 42, genre: ["Drama", "Fantasy", "Horror"]}),
  (office:TVShow {title: "The Office", startYear: 2005, endYear: 2013, seasons: 9, episodes: 201, genre: ["Comedy"]}),
  (friends:TVShow {title: "Friends", startYear: 1994, endYear: 2004, seasons: 10, episodes: 236, genre: ["Comedy", "Romance"]}),
  (gameOfThrones:TVShow {title: "Game of Thrones", startYear: 2011, endYear: 2019, seasons: 8, episodes: 73, genre: ["Action", "Adventure", "Drama"]}),
  (sherlock:TVShow {title: "Sherlock", startYear: 2010, endYear: 2017, seasons: 4, episodes: 13, genre: ["Crime", "Drama", "Mystery"]}),
  (westworld:TVShow {title: "Westworld", startYear: 2016, endYear: 2022, seasons: 4, episodes: 36, genre: ["Drama", "Mystery", "Sci-Fi"]});

// Create People (Harry Potter Cast, Directors, and TV Show People)
CREATE
  // Harry Potter main cast
  (daniel:Person {name: "Daniel Radcliffe", born: 1989}),
  (emma:Person {name: "Emma Watson", born: 1990}),
  (rupert:Person {name: "Rupert Grint", born: 1988}),
  (alan:Person {name: "Alan Rickman", born: 1946, died: 2016}),
  (maggie:Person {name: "Maggie Smith", born: 1934}),
  (robbie:Person {name: "Robbie Coltrane", born: 1950, died: 2022}),
  (ralph:Person {name: "Ralph Fiennes", born: 1962}),
  (helena:Person {name: "Helena Bonham Carter", born: 1966}),
  (tom:Person {name: "Tom Felton", born: 1987}),
  (bonnie:Person {name: "Bonnie Wright", born: 1991}),
  (matthew:Person {name: "Matthew Lewis", born: 1989}),
  (evanna:Person {name: "Evanna Lynch", born: 1991}),
  (gary:Person {name: "Gary Oldman", born: 1958}),
  (david:Person {name: "David Thewlis", born: 1963}),
  (jason:Person {name: "Jason Isaacs", born: 1963}),
  
  // Harry Potter directors
  (chris:Person {name: "Chris Columbus", born: 1958}),
  (alfonso:Person {name: "Alfonso Cuarón", born: 1961}),
  (mike:Person {name: "Mike Newell", born: 1942}),
  (davidYates:Person {name: "David Yates", born: 1963}),
  
  // TV Show people
  (bryan:Person {name: "Bryan Cranston", born: 1956}),
  (aaron:Person {name: "Aaron Paul", born: 1979}),
  (vince:Person {name: "Vince Gilligan", born: 1967}),
  (millie:Person {name: "Millie Bobby Brown", born: 2004}),
  (davidHarbour:Person {name: "David Harbour", born: 1975}),
  (winona:Person {name: "Winona Ryder", born: 1971}),
  (duffer1:Person {name: "Matt Duffer", born: 1984}),
  (duffer2:Person {name: "Ross Duffer", born: 1984}),
  (steve:Person {name: "Steve Carell", born: 1962}),
  (john:Person {name: "John Krasinski", born: 1979}),
  (jennifer:Person {name: "Jennifer Aniston", born: 1969}),
  (courteney:Person {name: "Courteney Cox", born: 1964}),
  (benedict:Person {name: "Benedict Cumberbatch", born: 1976}),
  (martin:Person {name: "Martin Freeman", born: 1971}),
  (steven:Person {name: "Steven Moffat", born: 1961});

// Harry Potter Movie Relationships
// Harry Potter and the Philosopher's Stone
MATCH (daniel:Person {name: "Daniel Radcliffe"}), (hp1:Movie {title: "Harry Potter and the Philosopher's Stone"})
CREATE (daniel)-[:ACTED_IN {roles: ["Harry Potter"]}]->(hp1);

MATCH (emma:Person {name: "Emma Watson"}), (hp1:Movie {title: "Harry Potter and the Philosopher's Stone"})
CREATE (emma)-[:ACTED_IN {roles: ["Hermione Granger"]}]->(hp1);

MATCH (rupert:Person {name: "Rupert Grint"}), (hp1:Movie {title: "Harry Potter and the Philosopher's Stone"})
CREATE (rupert)-[:ACTED_IN {roles: ["Ron Weasley"]}]->(hp1);

MATCH (alan:Person {name: "Alan Rickman"}), (hp1:Movie {title: "Harry Potter and the Philosopher's Stone"})
CREATE (alan)-[:ACTED_IN {roles: ["Severus Snape"]}]->(hp1);

MATCH (maggie:Person {name: "Maggie Smith"}), (hp1:Movie {title: "Harry Potter and the Philosopher's Stone"})
CREATE (maggie)-[:ACTED_IN {roles: ["Professor McGonagall"]}]->(hp1);

MATCH (robbie:Person {name: "Robbie Coltrane"}), (hp1:Movie {title: "Harry Potter and the Philosopher's Stone"})
CREATE (robbie)-[:ACTED_IN {roles: ["Rubeus Hagrid"]}]->(hp1);

MATCH (chris:Person {name: "Chris Columbus"}), (hp1:Movie {title: "Harry Potter and the Philosopher's Stone"})
CREATE (chris)-[:DIRECTED]->(hp1);

// Harry Potter and the Chamber of Secrets
MATCH (daniel:Person {name: "Daniel Radcliffe"}), (hp2:Movie {title: "Harry Potter and the Chamber of Secrets"})
CREATE (daniel)-[:ACTED_IN {roles: ["Harry Potter"]}]->(hp2);

MATCH (emma:Person {name: "Emma Watson"}), (hp2:Movie {title: "Harry Potter and the Chamber of Secrets"})
CREATE (emma)-[:ACTED_IN {roles: ["Hermione Granger"]}]->(hp2);

MATCH (rupert:Person {name: "Rupert Grint"}), (hp2:Movie {title: "Harry Potter and the Chamber of Secrets"})
CREATE (rupert)-[:ACTED_IN {roles: ["Ron Weasley"]}]->(hp2);

MATCH (alan:Person {name: "Alan Rickman"}), (hp2:Movie {title: "Harry Potter and the Chamber of Secrets"})
CREATE (alan)-[:ACTED_IN {roles: ["Severus Snape"]}]->(hp2);

MATCH (jason:Person {name: "Jason Isaacs"}), (hp2:Movie {title: "Harry Potter and the Chamber of Secrets"})
CREATE (jason)-[:ACTED_IN {roles: ["Lucius Malfoy"]}]->(hp2);

MATCH (chris:Person {name: "Chris Columbus"}), (hp2:Movie {title: "Harry Potter and the Chamber of Secrets"})
CREATE (chris)-[:DIRECTED]->(hp2);

// Harry Potter and the Prisoner of Azkaban
MATCH (daniel:Person {name: "Daniel Radcliffe"}), (hp3:Movie {title: "Harry Potter and the Prisoner of Azkaban"})
CREATE (daniel)-[:ACTED_IN {roles: ["Harry Potter"]}]->(hp3);

MATCH (emma:Person {name: "Emma Watson"}), (hp3:Movie {title: "Harry Potter and the Prisoner of Azkaban"})
CREATE (emma)-[:ACTED_IN {roles: ["Hermione Granger"]}]->(hp3);

MATCH (rupert:Person {name: "Rupert Grint"}), (hp3:Movie {title: "Harry Potter and the Prisoner of Azkaban"})
CREATE (rupert)-[:ACTED_IN {roles: ["Ron Weasley"]}]->(hp3);

MATCH (gary:Person {name: "Gary Oldman"}), (hp3:Movie {title: "Harry Potter and the Prisoner of Azkaban"})
CREATE (gary)-[:ACTED_IN {roles: ["Sirius Black"]}]->(hp3);

MATCH (david:Person {name: "David Thewlis"}), (hp3:Movie {title: "Harry Potter and the Prisoner of Azkaban"})
CREATE (david)-[:ACTED_IN {roles: ["Professor Lupin"]}]->(hp3);

MATCH (alfonso:Person {name: "Alfonso Cuarón"}), (hp3:Movie {title: "Harry Potter and the Prisoner of Azkaban"})
CREATE (alfonso)-[:DIRECTED]->(hp3);

// Harry Potter and the Goblet of Fire
MATCH (daniel:Person {name: "Daniel Radcliffe"}), (hp4:Movie {title: "Harry Potter and the Goblet of Fire"})
CREATE (daniel)-[:ACTED_IN {roles: ["Harry Potter"]}]->(hp4);

MATCH (emma:Person {name: "Emma Watson"}), (hp4:Movie {title: "Harry Potter and the Goblet of Fire"})
CREATE (emma)-[:ACTED_IN {roles: ["Hermione Granger"]}]->(hp4);

MATCH (rupert:Person {name: "Rupert Grint"}), (hp4:Movie {title: "Harry Potter and the Goblet of Fire"})
CREATE (rupert)-[:ACTED_IN {roles: ["Ron Weasley"]}]->(hp4);

MATCH (ralph:Person {name: "Ralph Fiennes"}), (hp4:Movie {title: "Harry Potter and the Goblet of Fire"})
CREATE (ralph)-[:ACTED_IN {roles: ["Lord Voldemort"]}]->(hp4);

MATCH (mike:Person {name: "Mike Newell"}), (hp4:Movie {title: "Harry Potter and the Goblet of Fire"})
CREATE (mike)-[:DIRECTED]->(hp4);

// Remaining Harry Potter films (abbreviated for main cast)
MATCH (daniel:Person {name: "Daniel Radcliffe"}), (hp5:Movie {title: "Harry Potter and the Order of the Phoenix"})
CREATE (daniel)-[:ACTED_IN {roles: ["Harry Potter"]}]->(hp5);

MATCH (emma:Person {name: "Emma Watson"}), (hp5:Movie {title: "Harry Potter and the Order of the Phoenix"})
CREATE (emma)-[:ACTED_IN {roles: ["Hermione Granger"]}]->(hp5);

MATCH (rupert:Person {name: "Rupert Grint"}), (hp5:Movie {title: "Harry Potter and the Order of the Phoenix"})
CREATE (rupert)-[:ACTED_IN {roles: ["Ron Weasley"]}]->(hp5);

MATCH (evanna:Person {name: "Evanna Lynch"}), (hp5:Movie {title: "Harry Potter and the Order of the Phoenix"})
CREATE (evanna)-[:ACTED_IN {roles: ["Luna Lovegood"]}]->(hp5);

MATCH (davidYates:Person {name: "David Yates"}), (hp5:Movie {title: "Harry Potter and the Order of the Phoenix"})
CREATE (davidYates)-[:DIRECTED]->(hp5);

MATCH (daniel:Person {name: "Daniel Radcliffe"}), (hp6:Movie {title: "Harry Potter and the Half-Blood Prince"})
CREATE (daniel)-[:ACTED_IN {roles: ["Harry Potter"]}]->(hp6);

MATCH (emma:Person {name: "Emma Watson"}), (hp6:Movie {title: "Harry Potter and the Half-Blood Prince"})
CREATE (emma)-[:ACTED_IN {roles: ["Hermione Granger"]}]->(hp6);

MATCH (rupert:Person {name: "Rupert Grint"}), (hp6:Movie {title: "Harry Potter and the Half-Blood Prince"})
CREATE (rupert)-[:ACTED_IN {roles: ["Ron Weasley"]}]->(hp6);

MATCH (tom:Person {name: "Tom Felton"}), (hp6:Movie {title: "Harry Potter and the Half-Blood Prince"})
CREATE (tom)-[:ACTED_IN {roles: ["Draco Malfoy"]}]->(hp6);

MATCH (davidYates:Person {name: "David Yates"}), (hp6:Movie {title: "Harry Potter and the Half-Blood Prince"})
CREATE (davidYates)-[:DIRECTED]->(hp6);

MATCH (daniel:Person {name: "Daniel Radcliffe"}), (hp7p1:Movie {title: "Harry Potter and the Deathly Hallows - Part 1"})
CREATE (daniel)-[:ACTED_IN {roles: ["Harry Potter"]}]->(hp7p1);

MATCH (emma:Person {name: "Emma Watson"}), (hp7p1:Movie {title: "Harry Potter and the Deathly Hallows - Part 1"})
CREATE (emma)-[:ACTED_IN {roles: ["Hermione Granger"]}]->(hp7p1);

MATCH (rupert:Person {name: "Rupert Grint"}), (hp7p1:Movie {title: "Harry Potter and the Deathly Hallows - Part 1"})
CREATE (rupert)-[:ACTED_IN {roles: ["Ron Weasley"]}]->(hp7p1);

MATCH (helena:Person {name: "Helena Bonham Carter"}), (hp7p1:Movie {title: "Harry Potter and the Deathly Hallows - Part 1"})
CREATE (helena)-[:ACTED_IN {roles: ["Bellatrix Lestrange"]}]->(hp7p1);

MATCH (davidYates:Person {name: "David Yates"}), (hp7p1:Movie {title: "Harry Potter and the Deathly Hallows - Part 1"})
CREATE (davidYates)-[:DIRECTED]->(hp7p1);

MATCH (daniel:Person {name: "Daniel Radcliffe"}), (hp7p2:Movie {title: "Harry Potter and the Deathly Hallows - Part 2"})
CREATE (daniel)-[:ACTED_IN {roles: ["Harry Potter"]}]->(hp7p2);

MATCH (emma:Person {name: "Emma Watson"}), (hp7p2:Movie {title: "Harry Potter and the Deathly Hallows - Part 2"})
CREATE (emma)-[:ACTED_IN {roles: ["Hermione Granger"]}]->(hp7p2);

MATCH (rupert:Person {name: "Rupert Grint"}), (hp7p2:Movie {title: "Harry Potter and the Deathly Hallows - Part 2"})
CREATE (rupert)-[:ACTED_IN {roles: ["Ron Weasley"]}]->(hp7p2);

MATCH (ralph:Person {name: "Ralph Fiennes"}), (hp7p2:Movie {title: "Harry Potter and the Deathly Hallows - Part 2"})
CREATE (ralph)-[:ACTED_IN {roles: ["Lord Voldemort"]}]->(hp7p2);

MATCH (alan:Person {name: "Alan Rickman"}), (hp7p2:Movie {title: "Harry Potter and the Deathly Hallows - Part 2"})
CREATE (alan)-[:ACTED_IN {roles: ["Severus Snape"]}]->(hp7p2);

MATCH (davidYates:Person {name: "David Yates"}), (hp7p2:Movie {title: "Harry Potter and the Deathly Hallows - Part 2"})
CREATE (davidYates)-[:DIRECTED]->(hp7p2);

// TV Show Relationships
MATCH (bryan:Person {name: "Bryan Cranston"}), (breaking:TVShow {title: "Breaking Bad"})
CREATE (bryan)-[:STARRED_IN {roles: ["Walter White"], seasons: [1,2,3,4,5]}]->(breaking);

MATCH (aaron:Person {name: "Aaron Paul"}), (breaking:TVShow {title: "Breaking Bad"})
CREATE (aaron)-[:STARRED_IN {roles: ["Jesse Pinkman"], seasons: [1,2,3,4,5]}]->(breaking);

MATCH (vince:Person {name: "Vince Gilligan"}), (breaking:TVShow {title: "Breaking Bad"})
CREATE (vince)-[:CREATED]->(breaking);

MATCH (millie:Person {name: "Millie Bobby Brown"}), (stranger:TVShow {title: "Stranger Things"})
CREATE (millie)-[:STARRED_IN {roles: ["Eleven"], seasons: [1,2,3,4]}]->(stranger);

MATCH (davidHarbour:Person {name: "David Harbour"}), (stranger:TVShow {title: "Stranger Things"})
CREATE (davidHarbour)-[:STARRED_IN {roles: ["Jim Hopper"], seasons: [1,2,3,4]}]->(stranger);

MATCH (winona:Person {name: "Winona Ryder"}), (stranger:TVShow {title: "Stranger Things"})
CREATE (winona)-[:STARRED_IN {roles: ["Joyce Byers"], seasons: [1,2,3,4]}]->(stranger);

MATCH (duffer1:Person {name: "Matt Duffer"}), (stranger:TVShow {title: "Stranger Things"})
CREATE (duffer1)-[:CREATED]->(stranger);

MATCH (duffer2:Person {name: "Ross Duffer"}), (stranger:TVShow {title: "Stranger Things"})
CREATE (duffer2)-[:CREATED]->(stranger);

MATCH (steve:Person {name: "Steve Carell"}), (office:TVShow {title: "The Office"})
CREATE (steve)-[:STARRED_IN {roles: ["Michael Scott"], seasons: [1,2,3,4,5,6,7]}]->(office);

MATCH (john:Person {name: "John Krasinski"}), (office:TVShow {title: "The Office"})
CREATE (john)-[:STARRED_IN {roles: ["Jim Halpert"], seasons: [1,2,3,4,5,6,7,8,9]}]->(office);

MATCH (jennifer:Person {name: "Jennifer Aniston"}), (friends:TVShow {title: "Friends"})
CREATE (jennifer)-[:STARRED_IN {roles: ["Rachel Green"], seasons: [1,2,3,4,5,6,7,8,9,10]}]->(friends);

MATCH (courteney:Person {name: "Courteney Cox"}), (friends:TVShow {title: "Friends"})
CREATE (courteney)-[:STARRED_IN {roles: ["Monica Geller"], seasons: [1,2,3,4,5,6,7,8,9,10]}]->(friends);

MATCH (benedict:Person {name: "Benedict Cumberbatch"}), (sherlock:TVShow {title: "Sherlock"})
CREATE (benedict)-[:STARRED_IN {roles: ["Sherlock Holmes"], seasons: [1,2,3,4]}]->(sherlock);

MATCH (martin:Person {name: "Martin Freeman"}), (sherlock:TVShow {title: "Sherlock"})
CREATE (martin)-[:STARRED_IN {roles: ["Dr. John Watson"], seasons: [1,2,3,4]}]->(sherlock);

MATCH (steven:Person {name: "Steven Moffat"}), (sherlock:TVShow {title: "Sherlock"})
CREATE (steven)-[:CREATED]->(sherlock);

// Cross-media connections (Harry Potter actors who also appeared in TV shows)
MATCH (helena:Person {name: "Helena Bonham Carter"}), (office:TVShow {title: "The Office"})
CREATE (helena)-[:STARRED_IN {roles: ["Guest appearance"], seasons: [2]}]->(office);

MATCH (jason:Person {name: "Jason Isaacs"}), (gameOfThrones:TVShow {title: "Game of Thrones"})
CREATE (jason)-[:STARRED_IN {roles: ["Guest appearance"], seasons: [1]}]->(gameOfThrones);

MATCH (maggie:Person {name: "Maggie Smith"}), (sherlock:TVShow {title: "Sherlock"})
CREATE (maggie)-[:STARRED_IN {roles: ["Guest appearance"], seasons: [1]}]->(sherlock);
