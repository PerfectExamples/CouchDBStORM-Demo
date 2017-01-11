//
//  Delete.swift
//  CouchDBStORM-Demo
//
//  Created by Jonathan Guthrie on 2017-01-11.
//
//

import StORM
import CouchDBStORM




/* =============================================================================================
Deleting object
============================================================================================= */
func deleteObject() throws {

	// First, we create a new object
	let obj = User()
	obj.firstname = "X"
	obj.lastname = "Y"

	do {
		try obj.save {id in obj.id = id }
	} catch {
		throw error
	}
	print("'deleteObject' - Object created for deletion with new id of \(obj.id)")
	// Object created, saved.


	// Now we delete the object directly.
	do {
		try obj.delete()
	} catch {
		throw error
	}
	print("'deleteObject' - Object deleted, id \(obj.id)")

}




/* =============================================================================================
Deleting object
============================================================================================= */
func deleteObjectByID() throws {

	// First, we create a new object
	let obj = User()
	obj.firstname = "X"
	obj.lastname = "Y"

	do {
		try obj.save {id in obj.id = id }
	} catch {
		throw error
	}

	print("'deleteObjectByID' - Object created for deletion by ID with new id of \(obj.id)")
	// Object created, saved.


	// Now we create a new object
	// Then we delete by reference
	// This means the object we are deleting has not been loaded into the new instance.
	let objForDelete = User()

	do {
		try objForDelete.get(obj.id)
		// No need to delete an empty doc!
		if !objForDelete._rev.isEmpty {
			try objForDelete.delete()
		}
	} catch {
		throw error
	}
	print("'deleteObjectByID' - Object deleted, id \(objForDelete.id)")
	
}
