package com.techelevator.model;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class Comic {
	   private Long comicId;
	   private String title;
	   private Long issue; 
	   private String author;
	   private String artist;
	   private String publisher; 
	
	 
	   
	    public Comic() {
		// TODO Auto-generated constructor stub
	}

	   public Comic(Long comicId, String title, Long issue, String author, String artist, String publisher) {
		   this.setComicId(comicId);
		   this.setTitle(title);
		   this.setIssue(issue); 
		   this.setAuthor(author);
		   this.setArtist(artist);
		   this.setPublisher(publisher);
		       
	   
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


}
