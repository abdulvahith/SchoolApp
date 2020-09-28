package com.full;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;

public class CheckUser {
	int i =10;
	static DatastoreService data = DatastoreServiceFactory.getDatastoreService();
	
	
	public static boolean checkValidUser(String rollNo) {
		Query q = new Query("Students");
		Query validUser = q.setFilter(new FilterPredicate("Student RollNo", FilterOperator.EQUAL, rollNo)).setKeysOnly();
		Entity currentEntity = data.prepare(validUser).asSingleEntity();
		if (currentEntity != null) {
			return true;
		} else {
			return false;
		}
	}
	
	public static Entity studentEntity(String rollNo) {
		Query q = new Query("Students");
		q.setFilter(new FilterPredicate("Student RollNo", FilterOperator.EQUAL, rollNo));
		PreparedQuery pq = data.prepare(q);
		Entity result = pq.asSingleEntity();
		return result;
	}
}
