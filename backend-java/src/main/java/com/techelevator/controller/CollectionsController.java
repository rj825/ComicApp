package com.techelevator.controller;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.techelevator.dao.CollectionDAO;
import com.techelevator.dao.UserDAO;
import com.techelevator.model.Collection;
import com.techelevator.model.LoginDTO;
import com.techelevator.model.RegisterUserDTO;
import com.techelevator.model.User;
import com.techelevator.security.jwt.JWTFilter;
import com.techelevator.security.jwt.TokenProvider;

@RestController
@CrossOrigin
public class CollectionsController {

	private final TokenProvider tokenProvider;
	private final AuthenticationManagerBuilder authenticationManagerBuilder;
	private UserDAO userDAO;
	private CollectionDAO collectionDAO;
	

	public CollectionsController(TokenProvider tokenProvider,
			AuthenticationManagerBuilder authenticationManagerBuilder, UserDAO userDAO, CollectionDAO collectionDAO) {
		this.tokenProvider = tokenProvider;
		this.authenticationManagerBuilder = authenticationManagerBuilder;
		this.userDAO = userDAO;
		this.collectionDAO = collectionDAO;
	}

	

	@ResponseStatus(HttpStatus.CREATED)
	@RequestMapping(value = "/collections", method = RequestMethod.POST)
	
	public void createCollection(Principal principal, @RequestBody Collection collection ) {
	collectionDAO.createCollection(principal, collection.getName(), collection.isPublicCollection());
				}

	
	@RequestMapping(value = "/collections/{collectionId}", method = RequestMethod.GET)
	public List <String> viewCollection( Principal principal,  Long collectionId ) {
	 return collectionDAO.viewCollection(principal, collectionId);
				}
	
	
}



	

