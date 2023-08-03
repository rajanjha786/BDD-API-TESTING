Feature: Sample Karate Test

  Background:
    * url 'http://localhost:9000/books'

  Scenario: Perform crud operation ok Book Catalog

    And request {"isbn": "1234567897", "title": "ECA",  "author": "Rajan",  "price": 9.9,  "publisher": "ABC"}
    When method POST
    Then status 201
    And match response == { "id": '#notnull', "isbn": "1234567897", "title": "ECA", "author": "Rajan", "price": 9.9, "publisher": "ABC", "version": 1, "createdDate": '#notnull', "lastModifiedDate": '#notnull'}

    Given path response.isbn
    When method GET
    Then status 200
    And match response == { "id": '#notnull', "isbn": "1234567897", "title": "ECA", "author": "Rajan", "price": 9.9, "publisher": "ABC", "version": 1, "createdDate": '#notnull', "lastModifiedDate": '#notnull'}

    Given path response.isbn
    And request {"isbn": "1234567897", "title": "ECA",  "author": "Rajan",  "price": 10.0,  "publisher": "ABC"}
    When method PUT
    Then status 200
    And match response == { "id": '#notnull', "isbn": "1234567897", "title": "ECA", "author": "Rajan", "price": 10.0, "publisher": "ABC", "version": 2, "createdDate": '#notnull', "lastModifiedDate": '#notnull'}

    Given path response.isbn
    When method DELETE
    Then status 204
