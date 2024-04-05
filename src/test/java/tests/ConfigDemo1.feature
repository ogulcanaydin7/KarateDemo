Feature: Config Demo

  Background:
    * url baseURL
    * header Accept = 'application/json'

  Scenario: Config Demo 1
    Given print name

  Scenario: Get Demo 1
    Given path '/users?page=2'
    When method GET
   # Then status 200
    And print response
    #cmd "mvn test -Dkarate.env=dev"