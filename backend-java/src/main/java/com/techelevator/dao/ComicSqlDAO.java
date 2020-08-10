package com.techelevator.dao;   

import java.security.Principal;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import com.techelevator.model.Collection;
import com.techelevator.model.Comic;
import com.techelevator.model.User;

@Service
public class ComicSqlDAO implements ComicDAO{
	
	private JdbcTemplate jdbcTemplate;
	private UserDAO userDAO;
	private CollectionDAO collectionDAO;

	public ComicSqlDAO(JdbcTemplate jdbcTemplate, UserDAO userDAO, CollectionDAO collectionDAO) {
		this.userDAO = userDAO;
		this.jdbcTemplate = jdbcTemplate;
		this.collectionDAO = collectionDAO;
	}
	
	public Comic getComicFromId(Long comicId) {
		String sql = "SELECT * FROM comics WHERE comic_id = ?";
		SqlRowSet rs = jdbcTemplate.queryForRowSet(sql, comicId);
		Comic comic = null;
		if (rs.next()) {
			comic = mapRowToComic(rs);
		}
		return comic;
	}
	
	private Comic mapRowToComic(SqlRowSet rs) {
		Comic comic = new Comic();
		comic.setTitle(rs.getString("title"));
		comic.setIssue(rs.getLong("issue"));
		comic.setAuthor(rs.getString("author"));
		comic.setArtist(rs.getString("artist"));
		comic.setPublisher(rs.getString("publisher"));
		return comic;
	}
	
	private Long getComicIdFromComicAttributes(String title, Long issue, String author,
			String artist, String publisher) {
		String sql = "SELECT comic_id FROM comics"
				+ " WHERE title = ? AND" + 
				" issue = ? AND" + 
				" author = ? AND" + 
				" artist = ? AND" + 
				" publisher = ?";
		SqlRowSet rs = jdbcTemplate.queryForRowSet(sql, title, issue, author, artist, publisher);
		Long comicId = null;
		if (rs.next()) {
			comicId = rs.getLong("comic_id");
		}
		return comicId;
	}
	

	public void addComic(Principal principal, Long collectionId, Comic comic) {
		String username = principal.getName();
		User user = userDAO.findByUsername(username);
		Long userId = user.getId();
		Long collectionUserId = collectionDAO.getCollection(collectionId).getUserId();
		String sql = "";
		String sql2 = "";
		if (userId == collectionUserId) {
		sql = "INSERT INTO comics (title, issue, author, artist, publisher, maincharacter) VALUES "
				+ "(?, ?, ?, ?, ?, ?)";
		sql2 = "INSERT INTO collection_comic (collection_id, comic_id) VALUES (?, ?)";
	    }
		String title = comic.getTitle();
		Long issue = comic.getIssue();
		String author = comic.getAuthor();
		String artist = comic.getArtist();
		String publisher = comic.getPublisher();
		jdbcTemplate.update(sql, title, issue, author, artist, publisher);
		Long comicId = getComicIdFromComicAttributes(title, issue, author, artist, publisher);
		jdbcTemplate.update(sql2, collectionId, comicId);
	}
	
}
