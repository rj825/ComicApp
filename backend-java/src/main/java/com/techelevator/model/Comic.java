package com.techelevator.model;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Comic {
	   private Long comicId;
		@JsonProperty("title") //could be the same
	   private String title;
		@JsonProperty("issueNumber")
	   private Long issue; 
		@JsonProperty("name")
	   private String author;
		@JsonProperty("name")
	   private String artist;
	   private String publisher;
	    @JsonProperty("name")
	   private String maincharacter;
	
	 
	   
	    public Comic() {
		// TODO Auto-generated constructor stub
	    }

	   public Comic(Long comicId, String title, Long issue, String author, String artist, String publisher, String maincharacter) {
		   this.setComicId(comicId);
		   this.setTitle(title);
		   this.setIssue(issue); 
		   this.setAuthor(author);
		   this.setArtist(artist);
		   this.setPublisher(publisher);
		   this.setMaincharacter(maincharacter);
		       
	   
	   }

	public Long getComicId() {
		return comicId;
	}

	public void setComicId(Long comicId) {
		this.comicId = comicId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getIssue() {
		return issue;
	}

	public void setIssue(Long issue) {
		this.issue = issue;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getMaincharacter() {
		return maincharacter;
	}

	public void setMaincharacter(String maincharacter) {
		this.maincharacter = maincharacter;
	}
	
	@SuppressWarnings("unchecked")
	@JsonProperty("data")
	public void unpackNested(Map<String,Object> results) {
		//IF WE MOVE OUT OF COMIC CLASS CHANGE THIS.* TO SETTER
		this.publisher = "Marvel";//CHANGE IF MOVED
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> data = (Map<String,Object>) results.get("data");
		List<Object> comics = (List<Object>) data.get("results");
		//I currently get 0 index because I only want the first one
		//for all matches you could iterate through the list using for each
		Map<String, Object> comicMap = (Map<String, Object>) comics.get(0);
		this.title = (String) comicMap.get("title");//CHANGE IF MOVED
		Integer issueNumber = (Integer) comicMap.get("issueNumber");
		this.issue = issueNumber.longValue();//CHANGE IF MOVED
		Map<String, Object> creators = (Map<String,Object>)comicMap.get("creators");
		List<Object> creatorsFullMap = (List<Object>)creators.get("items");
		for (Object creator:creatorsFullMap) {
			Map<String,String> creatorMap = (LinkedHashMap<String,String>) creator;
			if (creatorMap.get("role").contains("penciller") && this.artist == null) {
				this.artist = (String) creatorMap.get("name");//CHANGE IF MOVED
			}
			if (creatorMap.get("role").matches("writer") && this.author == null) {
				this.author = (String) creatorMap.get("name");//CHANGE IF MOVED
			}
		
		}
		Map<String,Object> characters = (Map<String,Object>)comicMap.get("characters");
		List<Object> charactersFullMap = (List<Object>)characters.get("items");
		for (Object character:charactersFullMap) {
			Map<String,String> characterMap = (LinkedHashMap<String,String>) character;
			if (this.maincharacter == null) {
				this.maincharacter = (String) characterMap.get("name");//CHANGE IF MOVED
			}
		}
	}
	
	@Override
	public String toString() {
		String comicString = "title = "+this.title+
							"/n issue = "+this.issue+
							"/n author = "+this.author+
							"/n artist = "+this.artist+
							"/n character = "+this.maincharacter;
		return comicString;
		
	}
}
