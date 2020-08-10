package com.techelevator.dao;

import java.security.Principal;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.client.RestClientResponseException;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.techelevator.model.Collection;
import com.techelevator.model.Comic;
import com.techelevator.model.ComicCharacter;
import com.techelevator.model.User;

@Service
public class MarvelAPISqlDAO implements MarvelAPIDAO{

	private JdbcTemplate jdbcTemplate;
	private UserDAO userDAO;
	private RestTemplate restTemplate = new RestTemplate();

	public MarvelAPISqlDAO(UserDAO userDAO, JdbcTemplate jdbcTemplate) {
		this.userDAO = userDAO;
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public void getComic(int id) {
		ResponseEntity response = restTemplate.getForEntity(
		                "https://gateway.marvel.com/v1/public/comics?"
		                + "apikey=9b2a0b50935e208ae26eb35665dffc5b&ts=1&hash=c32fef8c4f7a7d830777bf84df88b0df&"
		                + "id=" + id, 
		                String.class); // Make GET request using Client
		System.out.println(response.getBody()); // your return data returned from .getBody()
		
	}
	
	@SuppressWarnings("unchecked")
	@JsonProperty("data")
	public List<Comic> unpackNested(Map<String,Object> results) {
		//IF WE MOVE OUT OF COMIC CLASS CHANGE THIS.* TO SETTER
		List<Comic> searchResults = new ArrayList<Comic>();
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> data = (Map<String,Object>) results.get("data");
		List<Object> comics = (List<Object>) data.get("results");
		List<Comic> parsedComics = new ArrayList<Comic>();
		//I currently get 0 index because I only want the first one
		//for all matches you could iterate through the list using for each
		for (Object comic: comics) {
			Comic newComic = new Comic();
			newComic.setPublisher("Marvel");
			Map<String, Object> comicMap = (Map<String, Object>) comic;
			newComic.setTitle((String) comicMap.get("title"));//CHANGE IF MOVED
			Integer issueNumber = (Integer) comicMap.get("issueNumber");
			newComic.setIssue(issueNumber.longValue());//CHANGE IF MOVED
			Map<String, Object> creators = (Map<String,Object>)comicMap.get("creators");
			List<Object> creatorsFullMap = (List<Object>)creators.get("items");
			for (Object creator:creatorsFullMap) {
				Map<String,String> creatorMap = (LinkedHashMap<String,String>) creator;
				if (creatorMap.get("role").contains("penciller") && newComic.getArtist() == null) {
					newComic.setArtist((String) creatorMap.get("name"));//CHANGE IF MOVED
				}
				if (creatorMap.get("role").matches("writer") && newComic.getAuthor() == null) {
					newComic.setAuthor((String) creatorMap.get("name"));//CHANGE IF MOVED
				}
			
			}
			Map<String,Object> characters = (Map<String,Object>)comicMap.get("characters");
			List<Object> charactersFullMap = (List<Object>)characters.get("items");
			List<ComicCharacter> charactersInComic = new ArrayList<ComicCharacter>();
			for (Object character:charactersFullMap) {
				Map<String,String> characterMap = (LinkedHashMap<String,String>) character;
				ComicCharacter currentCharacter = new ComicCharacter();
				currentCharacter.setName((String) characterMap.get("name"));
				charactersInComic.add(currentCharacter);
			}
			newComic.setCharacters(charactersInComic);
			parsedComics.add(newComic);
		}
		return parsedComics;
		
	}

}
