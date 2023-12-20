// mongodb-queries.js

// Check if 'electronics' collection exists
var collectionExists = db.getCollectionNames().indexOf("electronics") !== -1;

if (collectionExists) {
	// Task 1: create Index
	db.electronics.createIndex({type:1});

	// Task 2: Count Laptops
	var laptopCount = db.electronics.countDocuments({type:"laptop"});
	print("Number of laptops:", laptopCount);

	// Task 3: Smart Phones with screen size 6 inches
	var countSmartphones = db.electronics.countDocuments({type:"smartphone", "screen size":6});
	print("Number of smart phones with screen size of 6 inches:", countSmartphones);

	// Task 4: Average Screen Size of Smartphones
	var avgScreenSize = db.electronics.aggregate([
		{$match:{type:"smartphone","screen size":{$exists:true}}},
		{$group: {_id:null,avgScreenSize: {$avg:"$screen size"}}}
		]).next().avgScreenSize;
	print("Average screen size of smartphones:", avgScreenSize);
} else {
	print("The 'electronics' collection does not exist.");
}

