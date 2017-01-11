//
//  main.swift
//  CouchDBStORM Demo
//
//  Created by Jonathan Guthrie on 2017-01-11.
//
//


import StORM
import CouchDBStORM

// Set the connection properties
// Change to suit your specific environment
CouchDBConnection.host = "localhost"
CouchDBConnection.username = "perfect"
CouchDBConnection.password = "perfect"
CouchDBConnection.port = 5984
CouchDBConnection.ssl = false


// Instantiate the table via "setup"
let obj = User()
try? obj.setup()



/*	===========================================================
	Create actions
===========================================================  */

// Standard Save
do {
	let _ = try saveNew()
} catch {
	print("\(error)")
}

// Direct Create
do {
	let _ = try saveCreate()
} catch {
	print("\(error)")
}





/*	===========================================================
	Update actions
===========================================================  */

// Standard Update
do {
	let _ = try saveUpdate()
} catch {
	print("\(error)")
}


/*	===========================================================
	Find / Select actions
===========================================================  */

// get by id
do {
	let _ = try getByID()
} catch {
	print("\(error)")
}

// perform a find
do {
	let _ = try findByStringAny()
} catch {
	print("\(error)")
}




/*	===========================================================
	Delete actions
===========================================================  */

// deleting an object
do {
	let _ = try deleteObject()
} catch {
	print("\(error)")
}

// deleting an object by id reference
do {
	let _ = try deleteObjectByID()
} catch {
	print("\(error)")
}

