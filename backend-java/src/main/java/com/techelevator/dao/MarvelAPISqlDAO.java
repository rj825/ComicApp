package com.techelevator.dao;

import java.security.Principal;



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

import com.techelevator.model.Collection;
import com.techelevator.model.Comic;
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

}
