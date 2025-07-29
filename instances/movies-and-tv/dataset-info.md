# Included Sample Data

The database contains the complete Harry Potter movie series with cast and crew:

<!-- toc -->

- [Harry Potter Movies (Complete Series)](#harry-potter-movies-complete-series)
  - [Main Cast](#main-cast)
  - [Directors](#directors)
- [Popular TV Series with Cast Information](#popular-tv-series-with-cast-information)
  - [Breaking Bad (2008-2013)](#breaking-bad-2008-2013)
  - [Stranger Things (2016-present)](#stranger-things-2016-present)
  - [The Office (2005-2013)](#the-office-2005-2013)
  - [Friends (1994-2004)](#friends-1994-2004)
  - [Game of Thrones (2011-2019)](#game-of-thrones-2011-2019)
  - [Sherlock (2010-2017)](#sherlock-2010-2017)
  - [Westworld (2016-2022)](#westworld-2016-2022)
- [Cross-Media Connections](#cross-media-connections)
- [Relationships](#relationships)
- [Sample Queries for Movies and TV Shows](#sample-queries-for-movies-and-tv-shows)
  - [Harry Potter movies](#harry-potter-movies)
  - [TV Shows](#tv-shows)
  - [Cross media queries](#cross-media-queries)

<!-- tocstop -->

## Harry Potter Movies (Complete Series)

1. **Harry Potter and the Philosopher's Stone** (2001) - Directed by Chris Columbus
2. **Harry Potter and the Chamber of Secrets** (2002) - Directed by Chris Columbus
3. **Harry Potter and the Prisoner of Azkaban** (2004) - Directed by Alfonso Cuarón
4. **Harry Potter and the Goblet of Fire** (2005) - Directed by Mike Newell
5. **Harry Potter and the Order of the Phoenix** (2007) - Directed by David Yates
6. **Harry Potter and the Half-Blood Prince** (2009) - Directed by David Yates
7. **Harry Potter and the Deathly Hallows - Part 1** (2010) - Directed by David Yates
8. **Harry Potter and the Deathly Hallows - Part 2** (2011) - Directed by David Yates

### Main Cast

- **Daniel Radcliffe** as Harry Potter (all films)
- **Emma Watson** as Hermione Granger (all films)
- **Rupert Grint** as Ron Weasley (all films)
- **Alan Rickman** as Severus Snape (†2016)
- **Maggie Smith** as Professor McGonagall
- **Robbie Coltrane** as Rubeus Hagrid (†2022)
- **Ralph Fiennes** as Lord Voldemort (films 4, 7-8)
- **Helena Bonham Carter** as Bellatrix Lestrange
- **Tom Felton** as Draco Malfoy
- **Gary Oldman** as Sirius Black
- **David Thewlis** as Professor Lupin
- **Jason Isaacs** as Lucius Malfoy
- **Evanna Lynch** as Luna Lovegood

### Directors

- **Chris Columbus** - First two films (Philosopher's Stone, Chamber of Secrets)
- **Alfonso Cuarón** - Prisoner of Azkaban
- **Mike Newell** - Goblet of Fire
- **David Yates** - Final four films (Order of Phoenix through Deathly Hallows Part 2)

## Popular TV Series with Cast Information

### Breaking Bad (2008-2013)

- **Genres**: Crime, Drama, Thriller
- **Seasons**: 5 | **Episodes**: 62
- **Main Cast**:
  - Bryan Cranston as Walter White
  - Aaron Paul as Jesse Pinkman
- **Created by**: Vince Gilligan

### Stranger Things (2016-present)

- **Genres**: Drama, Fantasy, Horror
- **Seasons**: 4 | **Episodes**: 42
- **Main Cast**:
  - Millie Bobby Brown as Eleven
  - David Harbour as Jim Hopper
  - Winona Ryder as Joyce Byers
- **Created by**: Matt & Ross Duffer

### The Office (2005-2013)

- **Genres**: Comedy
- **Seasons**: 9 | **Episodes**: 201
- **Main Cast**:
  - Steve Carell as Michael Scott
  - John Krasinski as Jim Halpert
- **Featured Guest**: Helena Bonham Carter (special episode crossover)

### Friends (1994-2004)

- **Genres**: Comedy, Romance
- **Seasons**: 10 | **Episodes**: 236
- **Main Cast**:
  - Jennifer Aniston as Rachel Green
  - Courteney Cox as Monica Geller

### Game of Thrones (2011-2019)

- **Genres**: Action, Adventure, Drama
- **Seasons**: 8 | **Episodes**: 73
- **Featured**: Jason Isaacs guest appearance

### Sherlock (2010-2017)

- **Genres**: Crime, Drama, Mystery
- **Seasons**: 4 | **Episodes**: 13
- **Main Cast**:
  - Benedict Cumberbatch as Sherlock Holmes
  - Martin Freeman as Dr. John Watson
- **Created by**: Steven Moffat

### Westworld (2016-2022)

- **Genres**: Drama, Mystery, Sci-Fi
- **Seasons**: 4 | **Episodes**: 36

## Cross-Media Connections

Several Harry Potter actors have appeared in the TV shows included in this database:

- **Helena Bonham Carter** (Bellatrix Lestrange) - Guest appearance in The Office
- **Jason Isaacs** (Lucius Malfoy) - Guest role in Game of Thrones
- **Gary Oldman** (Sirius Black) - Referenced connection to Sherlock universe
- **David Thewlis** (Professor Lupin) - Voice work in Westworld

## Relationships

- `ACTED_IN` - connects actors to Harry Potter movies with role information
- `STARRED_IN` - connects actors to TV shows with roles and season information
- `DIRECTED` - connects directors to movies
- `CREATED` - connects creators/showrunners to TV shows

## Sample Queries for Movies and TV Shows

### Harry Potter movies

```cypher
// Find all Harry Potter movies in chronological order
MATCH (movie:Movie)
WHERE movie.title CONTAINS "Harry Potter"
RETURN movie.title, movie.released, movie.runtime, movie.tagline
ORDER BY movie.released;

// Find all actors who appeared in Harry Potter movies
MATCH (person:Person)-[:ACTED_IN]->(movie:Movie)
WHERE movie.title CONTAINS "Harry Potter"
RETURN person.name, person.born, collect(movie.title) as movies
ORDER BY person.name;

// Find Daniel Radcliffe's filmography (within this database)
MATCH (daniel:Person {name: "Daniel Radcliffe"})-[:ACTED_IN]->(movie:Movie)
RETURN daniel.name, movie.title, movie.released
ORDER BY movie.released;

// Find directors and how many Harry Potter films they directed
MATCH (director:Person)-[:DIRECTED]->(movie:Movie)
WHERE movie.title CONTAINS "Harry Potter"
RETURN director.name, count(movie) as films_directed, collect(movie.title) as films
ORDER BY films_directed DESC;

// Find movies by David Yates (most prolific HP director)
MATCH (david:Person {name: "David Yates"})-[:DIRECTED]->(movie:Movie)
RETURN movie.title, movie.released
ORDER BY movie.released;

// Find the longest and shortest Harry Potter films
MATCH (movie:Movie)
WHERE movie.title CONTAINS "Harry Potter"
RETURN movie.title, movie.runtime
ORDER BY movie.runtime DESC;

// Find actors who were in multiple Harry Potter films
MATCH (person:Person)-[:ACTED_IN]->(movie:Movie)
WHERE movie.title CONTAINS "Harry Potter"
WITH person, count(movie) as film_count, collect(movie.title) as films
WHERE film_count > 1
RETURN person.name, film_count, films
ORDER BY film_count DESC;

// Find the main trio (Harry, Ron, Hermione) and their filmography
MATCH (person:Person)-[:ACTED_IN]->(movie:Movie)
WHERE person.name IN ["Daniel Radcliffe", "Emma Watson", "Rupert Grint"]
RETURN person.name, collect(movie.title) as films, count(movie) as film_count
ORDER BY person.name;

// Find movies released in the 2000s vs 2010s
MATCH (movie:Movie)
WHERE movie.title CONTAINS "Harry Potter"
RETURN
  CASE
    WHEN movie.released >= 2000 AND movie.released < 2010 THEN "2000s"
    ELSE "2010s"
  END as decade,
  collect(movie.title) as movies,
  count(movie) as count
ORDER BY decade;

// Find co-stars of Alan Rickman (Snape)
MATCH (alan:Person {name: "Alan Rickman"})-[:ACTED_IN]->(movie:Movie)<-[:ACTED_IN]-(costar:Person)
WHERE alan <> costar
RETURN DISTINCT costar.name, costar.born, collect(DISTINCT movie.title) as shared_movies
ORDER BY costar.name;

// Find all Fantasy genre movies
MATCH (movie:Movie)
WHERE "Fantasy" IN movie.genre
RETURN movie.title, movie.released, movie.genre
ORDER BY movie.released;

// Path between any two actors (example: Daniel Radcliffe to Alan Rickman)
MATCH path = shortestPath((daniel:Person {name: "Daniel Radcliffe"})-[*..4]-(alan:Person {name: "Alan Rickman"}))
RETURN path;

// Movies with their complete cast
MATCH (movie:Movie)<-[:ACTED_IN]-(actor:Person)
WHERE movie.title CONTAINS "Harry Potter"
RETURN movie.title, movie.released, collect(actor.name) as cast
ORDER BY movie.released
LIMIT 3;

// Find movies directed by different directors
MATCH (movie:Movie)<-[:DIRECTED]-(director:Person)
WHERE movie.title CONTAINS "Harry Potter"
RETURN director.name, collect(movie.title) as directed_films
ORDER BY director.name;
```

### TV Shows

```cypher
// Find all TV shows with their episode counts
MATCH (show:TVShow)
RETURN show.title, show.startYear, show.endYear, show.seasons, show.episodes, show.genre
ORDER BY show.episodes DESC;

// Find longest-running TV shows
MATCH (show:TVShow)
WHERE show.endYear IS NOT NULL
RETURN show.title, (show.endYear - show.startYear) as years_running, show.seasons
ORDER BY years_running DESC;

// Find TV shows still airing
MATCH (show:TVShow)
WHERE show.endYear IS NULL
RETURN show.title, show.startYear, show.seasons, show.episodes;

// Find TV shows by genre
MATCH (show:TVShow)
WHERE "Crime" IN show.genre
RETURN show.title, show.genre, show.startYear
ORDER BY show.startYear;

// Find co-stars in Breaking Bad
MATCH (show:TVShow {title: "Breaking Bad"})<-[:STARRED_IN]-(actor:Person)
RETURN actor.name, actor.born
ORDER BY actor.born;
```

### Cross media queries

```cypher
// Find Harry Potter actors who also appeared in TV shows
MATCH (person:Person)-[:ACTED_IN]->(movie:Movie)
WHERE movie.title CONTAINS "Harry Potter"
MATCH (person)-[:STARRED_IN]->(show:TVShow)
RETURN person.name,
       collect(DISTINCT movie.title) as harry_potter_movies,
       collect(DISTINCT show.title) as tv_shows;

// Compare movies vs TV shows by count
MATCH (content)
WHERE content:Movie OR content:TVShow
RETURN labels(content) as type, count(content) as count;

// Find all content from the 2000s
MATCH (content)
WHERE (content:Movie AND content.released >= 2000 AND content.released < 2010)
   OR (content:TVShow AND content.startYear >= 2000 AND content.startYear < 2010)
RETURN labels(content) as type, content.title,
       CASE
         WHEN content:Movie THEN content.released
         ELSE content.startYear
       END as year
ORDER BY year;

// Find creators and directors with their content
MATCH (person:Person)-[r:DIRECTED|CREATED]->(content)
RETURN person.name, type(r) as relationship,
       collect(content.title) as content_created
ORDER BY person.name;

// Path between a movie actor and TV actor
MATCH path = shortestPath((helena:Person {name: "Helena Bonham Carter"})-[*..6]-(bryan:Person {name: "Bryan Cranston"}))
RETURN path;

// Most prolific actors (by number of projects across movies and TV)
MATCH (person:Person)-[r:ACTED_IN|STARRED_IN]->(content)
RETURN person.name, count(content) as projects,
       collect(content.title) as titles
ORDER BY projects DESC
LIMIT 10;

// Find Fantasy content across both movies and TV
MATCH (content)
WHERE (content:Movie AND "Fantasy" IN content.genre)
   OR (content:TVShow AND "Fantasy" IN content.genre)
RETURN labels(content) as type, content.title, content.genre
ORDER BY content.title;

```
