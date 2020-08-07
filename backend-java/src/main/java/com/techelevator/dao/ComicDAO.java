package com.techelevator.dao;

import java.security.Principal;
import java.util.List;

import com.techelevator.model.Comic;

public interface ComicDAO {

	void addComic(Principal principal, Long collectionId, Comic comic);
	
	Comic getComicFromId(Long comicId);
	
}
