#!/bin/bash
# Generic Neo4j Seeding Script Template
# This script is shared by all Neo4j instances and configured via environment variables.
# See README.md for usage instructions and available environment variables.

# Configuration variables with defaults
INSTANCE_NAME=${INSTANCE_NAME:-"default"}
DATASET_NAME=${DATASET_NAME:-"generic"}
NEO4J_PASSWORD=${NEO4J_PASSWORD:-"password"}
NEO4J_HOST=${NEO4J_HOST:-"${INSTANCE_NAME}-neo4j"}
NEO4J_PORT=${NEO4J_PORT:-"7687"}
NEO4J_USER=${NEO4J_USER:-"neo4j"}
CYPHER_FILE=${CYPHER_FILE:-"/var/lib/neo4j/scripts/${INSTANCE_NAME}-data.cypher"}
SLEEP_INTERVAL=${SLEEP_INTERVAL:-"2"}

# Construct the bolt URL
BOLT_URL="bolt://${NEO4J_HOST}:${NEO4J_PORT}"

# Wait for Neo4j to be ready
echo "Waiting for Neo4j to start at ${BOLT_URL}..."
until cypher-shell -a "${BOLT_URL}" -u "${NEO4J_USER}" -p "${NEO4J_PASSWORD}" "RETURN 1" > /dev/null 2>&1; do
  sleep "${SLEEP_INTERVAL}"
  echo "Still waiting for ${INSTANCE_NAME}..."
done

echo "${INSTANCE_NAME} is ready! Using default neo4j database..."
echo "Checking if data already exists in neo4j database..."

# Check if data already exists in the default neo4j database
MOVIE_COUNT=$(cypher-shell -a "${BOLT_URL}" -u "${NEO4J_USER}" -p "${NEO4J_PASSWORD}" "MATCH (n) RETURN count(n) as count" --format plain | tail -n 1)

if [ "$MOVIE_COUNT" -eq "0" ]; then
  echo "No existing data found. Seeding neo4j database..."
  cypher-shell -a "${BOLT_URL}" -u "${NEO4J_USER}" -p "${NEO4J_PASSWORD}" -f "${CYPHER_FILE}"
  echo "neo4j database seeded successfully with ${DATASET_NAME} data!"
else
  echo "Database already contains $MOVIE_COUNT nodes. Skipping seeding."
fi
