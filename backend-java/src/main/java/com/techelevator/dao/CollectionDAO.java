package com.techelevator.dao;

import java.security.Principal;

import java.util.List;

import com.techelevator.model.Collection;
import com.techelevator.model.User;

public interface CollectionDAO {

	void createCollection(Principal principal, String collectionName, boolean isPublic);

	Collection getCollection(Long collectionId);

	List<String> viewCollection(Principal principal, Long collectionId);

	List<String> viewCollection(Long collectionId);

	List<Collection> viewCollections(Principal principal);

	List<Collection> viewCollections();

	List<Collection> viewMyCollections(Principal principal, String username);

//	int getNumberOfIssuesForCharacterInCollection(Principal principal, int collection_id,
//			String maincharacter);

	int getNumberOfIssuesForAuthorInCollection(Principal principal, int collection_id, String author);

	int getNumberOfIssuesForArtistInCollection(Principal principal, int collection_id, String artist);

//	int getNumberOfIssuesForCharacterInCollections(Principal principal, String maincharacter);

	int getNumberOfIssuesForAuthorInCollections(Principal principal, String author);

	int getNumberOfIssuesForArtistInCollections(Principal principal, String artist);

}
