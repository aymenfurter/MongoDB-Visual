CREATE INDEX ON :Server(ip)
CREATE INDEX ON :Database(dbname)

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///temp/databases.csv" AS row
MERGE (s:Server {ip: row.ip})
MERGE (db:Database {dbname: row.dbname})
ON CREATE SET db.dbsize = row.dbsize
MERGE (s)-[:CHILD]->(db)
