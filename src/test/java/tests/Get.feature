Feature: Get API Demo

  Background:
    * url 'https://reqres.in'
    * header Accept = 'application/json'

  #Simple Get Request
  Scenario: Get Demo 1
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies

    # Get with Background
  Scenario: Get Demo 2
    Given path '/api/users?page=2'
    When method GET
    Then status 200
    And print response

    # Get with Path, Parameters
  Scenario: Get Demo 3
    Given path '/api/users'
    And param page = 2
    When method GET
    Then status 200
    And print response

    #Get with Assertions
  @smoke
  Scenario: Get Demo 4
    Given path '/api/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    #isimin boş olmadığını kontrol ediyor https://jsonpathfinder.com/ dan response dökümünü
    And match response .data[0].first_name != null
    #6 adet verinin olduğunu kontrol ediyor
    And assert response.data.length == 6
    # data idsinin  10 olduğunu kontrol ediyor [] içindeki kaç nolu data
    And match response.data[3].id == 10
    # data 4 last name kontrol
    And match response.data[4].last_name == 'Edwards'

    #Single User Not Found
  Scenario: Get Demo 5
    Given path '/api/users/23'
    When method GET
    Then status 404
    And print response

    #List <Resource>
  Scenario: Get Demo 6
    Given path '/api/unknown'
    When method GET
    Then status 200
    And print response

   # Get with Delay
  Scenario: Get Demo 7
    Given path '/api/users'
    And param delay = 3
    When method GET
    Then status 200
    And print response