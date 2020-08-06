package com.techelevator.dao;
import java.security.Principal;
import java.util.List;

import com.techelevator.model.Collection;
import com.techelevator.model.User;

public interface CollectionDAO {
	
	 void createCollection (Principal principal, String collectionName, boolean isPublic);
	 
	 Collection getCollection(Long collectionId);
	 
	 List <String> viewCollection(Principal principal, Long collectionId);
	 
	 List <Collection> viewCollections( Principal principal);
	 	 
	 
	 
	 

}
