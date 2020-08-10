package com.techelevator;

import java.util.HashMap;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.techelevator.model.Comic;

@SpringBootTest
class ApplicationTests {
	
	private final String JSON_STRING = "{\r\n" + 
			"    \"code\": 200,\r\n" + 
			"    \"status\": \"Ok\",\r\n" + 
			"    \"copyright\": \"\u00A9 2020 MARVEL\",\r\n" + 
			"    \"attributionText\": \"Data provided by Marvel. \u00A9 2020 MARVEL\",\r\n" + 
			"    \"attributionHTML\": \"<a href=\\\"http://marvel.com\\\">Data provided by Marvel. \u00A9 2020 MARVEL</a>\",\r\n" + 
			"    \"etag\": \"132ea6d1a29dbb5edcd4da03a34d845074749769\",\r\n" + 
			"    \"data\": {\r\n" + 
			"        \"offset\": 0,\r\n" + 
			"        \"limit\": 1,\r\n" + 
			"        \"total\": 11,\r\n" + 
			"        \"count\": 1,\r\n" + 
			"        \"results\": [\r\n" + 
			"            {\r\n" + 
			"                \"id\": 68156,\r\n" + 
			"                \"digitalId\": 50575,\r\n" + 
			"                \"title\": \"Deadpool (2018) #9\",\r\n" + 
			"                \"issueNumber\": 9,\r\n" + 
			"                \"variantDescription\": \"\",\r\n" + 
			"                \"description\": null,\r\n" + 
			"                \"modified\": \"2018-12-14T09:04:51-0500\",\r\n" + 
			"                \"isbn\": \"\",\r\n" + 
			"                \"upc\": \"75960609035800911\",\r\n" + 
			"                \"diamondCode\": \"DEC181005\",\r\n" + 
			"                \"ean\": \"\",\r\n" + 
			"                \"issn\": \"\",\r\n" + 
			"                \"format\": \"Comic\",\r\n" + 
			"                \"pageCount\": 32,\r\n" + 
			"                \"textObjects\": [],\r\n" + 
			"                \"resourceURI\": \"http://gateway.marvel.com/v1/public/comics/68156\",\r\n" + 
			"                \"urls\": [\r\n" + 
			"                    {\r\n" + 
			"                        \"type\": \"detail\",\r\n" + 
			"                        \"url\": \"http://marvel.com/comics/issue/68156/deadpool_2018_9?utm_campaign=apiRef&utm_source=9b2a0b50935e208ae26eb35665dffc5b\"\r\n" + 
			"                    },\r\n" + 
			"                    {\r\n" + 
			"                        \"type\": \"purchase\",\r\n" + 
			"                        \"url\": \"http://comicstore.marvel.com/Deadpool-9/digital-comic/50575?utm_campaign=apiRef&utm_source=9b2a0b50935e208ae26eb35665dffc5b\"\r\n" + 
			"                    },\r\n" + 
			"                    {\r\n" + 
			"                        \"type\": \"reader\",\r\n" + 
			"                        \"url\": \"http://marvel.com/digitalcomics/view.htm?iid=50575&utm_campaign=apiRef&utm_source=9b2a0b50935e208ae26eb35665dffc5b\"\r\n" + 
			"                    },\r\n" + 
			"                    {\r\n" + 
			"                        \"type\": \"inAppLink\",\r\n" + 
			"                        \"url\": \"https://applink.marvel.com/issue/50575?utm_campaign=apiRef&utm_source=9b2a0b50935e208ae26eb35665dffc5b\"\r\n" + 
			"                    }\r\n" + 
			"                ],\r\n" + 
			"                \"series\": {\r\n" + 
			"                    \"resourceURI\": \"http://gateway.marvel.com/v1/public/series/24294\",\r\n" + 
			"                    \"name\": \"Deadpool (2018 - 2019)\"\r\n" + 
			"                },\r\n" + 
			"                \"variants\": [],\r\n" + 
			"                \"collections\": [],\r\n" + 
			"                \"collectedIssues\": [],\r\n" + 
			"                \"dates\": [\r\n" + 
			"                    {\r\n" + 
			"                        \"type\": \"onsaleDate\",\r\n" + 
			"                        \"date\": \"2019-02-06T00:00:00-0500\"\r\n" + 
			"                    },\r\n" + 
			"                    {\r\n" + 
			"                        \"type\": \"focDate\",\r\n" + 
			"                        \"date\": \"2019-01-14T00:00:00-0500\"\r\n" + 
			"                    },\r\n" + 
			"                    {\r\n" + 
			"                        \"type\": \"unlimitedDate\",\r\n" + 
			"                        \"date\": \"2019-08-12T00:00:00-0400\"\r\n" + 
			"                    },\r\n" + 
			"                    {\r\n" + 
			"                        \"type\": \"digitalPurchaseDate\",\r\n" + 
			"                        \"date\": \"2019-02-06T00:00:00-0500\"\r\n" + 
			"                    }\r\n" + 
			"                ],\r\n" + 
			"                \"prices\": [\r\n" + 
			"                    {\r\n" + 
			"                        \"type\": \"printPrice\",\r\n" + 
			"                        \"price\": 3.99\r\n" + 
			"                    },\r\n" + 
			"                    {\r\n" + 
			"                        \"type\": \"digitalPurchasePrice\",\r\n" + 
			"                        \"price\": 3.99\r\n" + 
			"                    }\r\n" + 
			"                ],\r\n" + 
			"                \"thumbnail\": {\r\n" + 
			"                    \"path\": \"http://i.annihil.us/u/prod/marvel/i/mg/9/30/5c523c0551fff\",\r\n" + 
			"                    \"extension\": \"jpg\"\r\n" + 
			"                },\r\n" + 
			"                \"images\": [\r\n" + 
			"                    {\r\n" + 
			"                        \"path\": \"http://i.annihil.us/u/prod/marvel/i/mg/9/30/5c523c0551fff\",\r\n" + 
			"                        \"extension\": \"jpg\"\r\n" + 
			"                    },\r\n" + 
			"                    {\r\n" + 
			"                        \"path\": \"http://i.annihil.us/u/prod/marvel/i/mg/f/f0/5bfedd93529dd\",\r\n" + 
			"                        \"extension\": \"jpg\"\r\n" + 
			"                    }\r\n" + 
			"                ],\r\n" + 
			"                \"creators\": {\r\n" + 
			"                    \"available\": 4,\r\n" + 
			"                    \"collectionURI\": \"http://gateway.marvel.com/v1/public/comics/68156/creators\",\r\n" + 
			"                    \"items\": [\r\n" + 
			"                        {\r\n" + 
			"                            \"resourceURI\": \"http://gateway.marvel.com/v1/public/creators/974\",\r\n" + 
			"                            \"name\": \"Jeff Eckleberry\",\r\n" + 
			"                            \"role\": \"letterer\"\r\n" + 
			"                        },\r\n" + 
			"                        {\r\n" + 
			"                            \"resourceURI\": \"http://gateway.marvel.com/v1/public/creators/4989\",\r\n" + 
			"                            \"name\": \"Nic Klein\",\r\n" + 
			"                            \"role\": \"penciler (cover)\"\r\n" + 
			"                        },\r\n" + 
			"                        {\r\n" + 
			"                            \"resourceURI\": \"http://gateway.marvel.com/v1/public/creators/11921\",\r\n" + 
			"                            \"name\": \"Jacob Thomas\",\r\n" + 
			"                            \"role\": \"editor\"\r\n" + 
			"                        },\r\n" + 
			"                        {\r\n" + 
			"                            \"resourceURI\": \"http://gateway.marvel.com/v1/public/creators/7190\",\r\n" + 
			"                            \"name\": \"Skottie Young\",\r\n" + 
			"                            \"role\": \"writer\"\r\n" + 
			"                        }\r\n" + 
			"                    ],\r\n" + 
			"                    \"returned\": 4\r\n" + 
			"                },\r\n" + 
			"                \"characters\": {\r\n" + 
			"                    \"available\": 1,\r\n" + 
			"                    \"collectionURI\": \"http://gateway.marvel.com/v1/public/comics/68156/characters\",\r\n" + 
			"                    \"items\": [\r\n" + 
			"                        {\r\n" + 
			"                            \"resourceURI\": \"http://gateway.marvel.com/v1/public/characters/1009268\",\r\n" + 
			"                            \"name\": \"Deadpool\"\r\n" + 
			"                        }\r\n" + 
			"                    ],\r\n" + 
			"                    \"returned\": 1\r\n" + 
			"                },\r\n" + 
			"                \"stories\": {\r\n" + 
			"                    \"available\": 2,\r\n" + 
			"                    \"collectionURI\": \"http://gateway.marvel.com/v1/public/comics/68156/stories\",\r\n" + 
			"                    \"items\": [\r\n" + 
			"                        {\r\n" + 
			"                            \"resourceURI\": \"http://gateway.marvel.com/v1/public/stories/148391\",\r\n" + 
			"                            \"name\": \"cover from Deadpool (2018) #9\",\r\n" + 
			"                            \"type\": \"cover\"\r\n" + 
			"                        },\r\n" + 
			"                        {\r\n" + 
			"                            \"resourceURI\": \"http://gateway.marvel.com/v1/public/stories/148392\",\r\n" + 
			"                            \"name\": \"story from Deadpool (2018) #9\",\r\n" + 
			"                            \"type\": \"interiorStory\"\r\n" + 
			"                        }\r\n" + 
			"                    ],\r\n" + 
			"                    \"returned\": 2\r\n" + 
			"                },\r\n" + 
			"                \"events\": {\r\n" + 
			"                    \"available\": 0,\r\n" + 
			"                    \"collectionURI\": \"http://gateway.marvel.com/v1/public/comics/68156/events\",\r\n" + 
			"                    \"items\": [],\r\n" + 
			"                    \"returned\": 0\r\n" + 
			"                }\r\n" + 
			"            }\r\n" + 
			"        ]\r\n" + 
			"    }\r\n" + 
			"}";

    @Test
    void contextLoads() {
    }
    
    @SuppressWarnings("unchecked")
	@Test public void resultsFromApiShouldMapCorrectly() {
    	//Arrange
    	Comic testComic = new Comic();
    	testComic.setTitle("Spider-Man (2016) #9");
    	Long comicIssue = new Long(9);
    	testComic.setIssue(comicIssue);
    	testComic.setMaincharacter("Spider-Man (Miles Morales)");
    	testComic.setArtist("Nico Leon");
    	testComic.setAuthor("Brian Michael Bendis");
    	
    	ObjectMapper mapper = new ObjectMapper();
    	
    	Comic parsedComic = new Comic();
    	Map<String, Object> map = new HashMap<String,Object>();
    	try {
			map = mapper.readValue(JSON_STRING, Map.class);
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	//Act
    	parsedComic.unpackNested(map);
    	String parsedString = parsedComic.toString();
    	String testString = testComic.toString();

    	
    	
    }
    
    

}
