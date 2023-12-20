// db-setup.js

// use admin;

// Task 1: Import 'catalog.json' into MongoDB server

var importCommand = 'mongoimport --db catalog --collection electronics --file catalog.json --jsonArray --createCollection';
var importResult = runProgram(importCommand);
print("Task 1 - Import Result:", importResult);

// Task 2: List out all the databases
var allDatabases = db.adminCommand({ listDatabases: 1 }).databases;
print("Task 2 - All Databases:", allDatabases.map(db=>db.name));

// use catalog;

// Task 3: List out all the collections in the 'catalog' database
var catalogCollections = db.getCollectionNames();
print("Task 3 - Collections in 'catalog' Database:", catalogCollections);

//Task 4: Export fields _id, 'type', 'model' from the 'electronics' collection to 'electronics.csv'
var exportCommand = 'mongoexport --db catalog --collection electronics --type=csv --fields _id,type,model --out electronics.csv';
var exportResult = runProgram(exportCommand);
print("Task 4 - Export Result:", exportResult);

// function runShellCommand(command) {
//	var result = shellExec(command);
//	return result;
//} 
