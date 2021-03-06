//
//  Create.swift
//  CouchDBStORM-Demo
//
//  Created by Jonathan Guthrie on 2017-01-11.
//
//

import StORM
import CouchDBStORM


/* =============================================================================================
Save - New row
Note that there no id property. This tells the ORM to create a new row, and the closure assigns the id on response.
If you have a non-database-assigned id, you will need to use the "create" method instead.
============================================================================================= */
func saveNew() throws -> User {

	let obj = User()
	obj.firstname = "X"
	obj.lastname = "Y"

	do {
		try obj.save {id in obj.id = id }
	} catch {
		throw error
	}

	print("'saveNew' - Object created with new id of \(obj.id)")
	return obj
}





/* =============================================================================================
Save - New row with code-assigned ID.
============================================================================================= */
func saveCreate() throws -> User {

	// First, we are making absolutely sure this will succeed because we are assigning the ID in code, not in daabase.
	// Therefore we delete any pre-existing row that uses this ID.
	// This is only for demonstration purposes.
	let deleting = User()
	do {
		try deleting.find(["_id":"test10001"])
		// No need to delete an empty doc!
		if !deleting._rev.isEmpty {
			try deleting.delete()
		}
	} catch {
		throw error
	}


	// Now save a new row, with a code-assigned ID.
	let obj = User()

	do {
		obj.id			= "test10001"
		obj.firstname	= "Mister"
		obj.lastname	= "PotatoHead"
		obj.email		= "potato@example.com"
		try obj.create()
	} catch {
		throw error
	}

	print("'saveCreate' = Object created with code-assigned id of \(obj.id)")
	return obj
}





