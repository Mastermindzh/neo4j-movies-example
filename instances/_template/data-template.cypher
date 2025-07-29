// Template data file for new Neo4j instances
// Replace this content with your specific dataset

// Example: Books dataset
// CREATE
//   (book1:Book {title: "Example Book", author: "Author Name", published: 2020}),
//   (author1:Person {name: "Author Name", born: 1980});
//
// MATCH (author1:Person {name: "Author Name"}), (book1:Book {title: "Example Book"})
// CREATE (author1)-[:WROTE]->(book1);

// Example: Music dataset
// CREATE
//   (album1:Album {title: "Example Album", released: 2020}),
//   (artist1:Person {name: "Artist Name", born: 1985});
//
// MATCH (artist1:Person {name: "Artist Name"}), (album1:Album {title: "Example Album"})
// CREATE (artist1)-[:RELEASED]->(album1);

// Add your dataset-specific nodes and relationships here
CREATE (placeholder:Node {message: "Replace this with your actual data"});
