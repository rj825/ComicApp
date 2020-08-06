package com.techelevator.dao;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.techelevator.model.Collection;
import com.techelevator.model.User;

@Service
public class CollectionSqlDAO implements CollectionDAO {
	private JdbcTemplate jdbcTemplate;
	private UserDAO userDAO;

	public CollectionSqlDAO(JdbcTemplate jdbcTemplate, UserDAO userDAO) {
		this.userDAO = userDAO;
		this.jdbcTemplate = jdbcTemplate;
	}

	public void createCollection(Principal principal, String collectionName, boolean isPublic) {
		String username = principal.getName();
		User user = userDAO.findByUsername(username);
		Long userId = user.getId();
		String sql = "INSERT INTO collections (user_id, name, isPublic) VALUES (?, ?, ?)";
		jdbcTemplate.update(sql, userId, collectionName, isPublic);
	}

	public Collection getCollection(Long collectionId) {
		String sql = "SELECT * FROM collections WHERE collection_id = ?";
		SqlRowSet rs = jdbcTemplate.queryForRowSet(sql, collectionId);
		if(rs.next()) {
		return mapRowToCollection(rs);
	}else {
		return null;
	}
	}

	private Collection mapRowToCollection(SqlRowSet rs) {
		Collection collection = new Collection();
		collection.setCollectionId(rs.getLong("collection_id"));
		collection.setName(rs.getString("name"));
		collection.setUserId(rs.getLong("user_id"));
		collection.setPublicCollection(rs.getBoolean("isPublic"));
		return collection;

	}

	public List<String> viewCollection(Principal principal, Long collectionId) {
		String sql = "SELECT comics.title FROM collections INNER JOIN collection_comic ON collection_comic.collection_id = collections.collection_id"
				+ " INNER JOIN comics ON comics.comic_id = collection_comic.comic_id WHERE collections.collection_id = ?";
		SqlRowSet rs = jdbcTemplate.queryForRowSet(sql, collectionId);
		List<String> listOfComics = new ArrayList<String>();
		while (rs.next()) {
			listOfComics.add(rs.getString("title"));
		}
	
		Long collectionUserId = getCollection(collectionId).getUserId();
		Long userId = userDAO.findByUsername(principal.getName()).getId();
		
		if (userId == collectionUserId || getCollection(collectionId).isPublicCollection()) {
			return listOfComics;
		}
		else {
			return null;
		}

	}
	
	public List<Collection> viewCollections(Principal principal) {
		String sql = "";
		if (principal!=null) {
		sql = "SELECT collections.* FROM collections JOIN users ON users.user_id = collections.user_id "
				+ "WHERE collections.user_id = ? OR collections.isPublic = TRUE";
		} else {
			sql = "SELECT * FROM collections WHERE collections.isPublic = TRUE";
		}
		Long userId = userDAO.findByUsername(principal.getName()).getId();
		SqlRowSet rs = jdbcTemplate.queryForRowSet(sql, userId);
		List<Collection> listOfCollections = new ArrayList<Collection>();
		while (rs.next()) {
			Collection currentCollection = mapRowToCollection(rs);
			listOfCollections.add(currentCollection);
		}
		
		return listOfCollections;

	}
	
	
	
	
	
	
	
	
	
}
