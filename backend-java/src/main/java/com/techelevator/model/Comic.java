package com.techelevator.model;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

public class Comic {
		@JsonProperty("id")
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


}
