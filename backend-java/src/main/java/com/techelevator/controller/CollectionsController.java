package com.techelevator.controller;

import java.io.Console;
import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Required;
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
import com.sun.el.stream.Optional;
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
	public List <String> viewCollection( Principal principal, @PathVariable Long collectionId) {
		if (principal == null) {
			return collectionDAO.viewCollection(collectionId);
		}
	 return collectionDAO.viewCollection(principal, collectionId);
				}
	
	
	@RequestMapping(value = "/collections", method = RequestMethod.GET)
	public List <Collection> viewCollections(Principal principal) {
		if (principal == null) {
			return collectionDAO.viewCollections();
		} else {
			return collectionDAO.viewCollections(principal);
		}
				}
	
//	@RequestMapping(value = "/collections", method = RequestMethod.GET, params = {})
//	public List <Collection> viewCollections() {
//	 return collectionDAO.viewCollections();
//				}
	
	
}



	

