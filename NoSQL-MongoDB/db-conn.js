// db-setup.js

conn = db.getMongo()
db = conn.getDB('catalog');

// Task: List out all the collections in the 'catalog' database
var catalogCollections = db.createCollection('electronics');
printjson("Task 3 - Collections in 'catalog' Database:", catalogCollections);

