Feature: Post API Demo

  Background:
    * url 'https://reqres.in'
    * header Accept = 'application/json'
    * def requestBody = read("request1.json")
    * def expectedOutput = read("response1.json")
    * def request2Body = read("data/request2.json")
    * def expectedOutput2 = read("data/response2.json")


  # Simple Post request
  Scenario:  Post Demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "Ogulcan","job": "Aydin"}
    When method POST
    Then status 201
    And print response

  #Post with background
  Scenario:  Post Demo 2
    Given path '/api/users'
    And request {"name": "Ogulcan","job": "Aydin"}
    When method POST
    Then status 201
    And print response

  #Post with assertions
  Scenario:  Post Demo 3
    Given path '/api/users'
    And request {"name": "Ogulcan","job": "Aydin"}
    When method POST
    Then status 201
    And print response
    And match response == {"name": "Ogulcan","job": "Aydin","id": "#string","createdAt": "#ignore"}

  #Post with read "response" from file "response1.json"
  Scenario:  Post Demo 4
    Given path '/api/users'
    And request {"name": "Ogulcan","job": "Aydin"}
    When method POST
    Then status 201
    And match response == expectedOutput
    #response yerine $
    And match $ == expectedOutput
    And print response

  # Post with read "request" from file "request1.json"
  Scenario:  Post Demo 5
    Given path '/api/users'
    And request requestBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response


  #Farklı konumdaki dosyadan  verileri alma "data"
  Scenario:  Post Demo 6
    Given path '/api/users'
    And request request2Body
    When method POST
    Then status 201
    And print response
    And match response == expectedOutput2
    And print response

  # Alınan veriyi değiştirelim
  Scenario:  Post Demo 7
    Given path '/api/users'
    And request requestBody
    And set requestBody.job = 'engineer'
    When method POST
    Then status 201
    #And match response == expectedOutput
    And print response

    #Register - Successful
  Scenario:  Post Demo 8
    Given path '/api/register'
    And request {"email": "eve.holt@reqres.in","password": "pistol"}
    When method POST
    Then status 200
    And print response

  #Register - Unsuccessful
  Scenario:  Post Demo 9
    Given path '/api/register'
    And request {"email": "sydney@fife"}
    When method POST
    Then status 400
    And print response

    #Login - Successful
  Scenario:  Post Demo 8
    Given path '/api/login'
    And request {"email": "eve.holt@reqres.in","password": "cityslicka"}
    When method POST
    Then status 200
    And print response

    #Login - Unsuccessful
  Scenario:  Post Demo 8
    Given path '/api/login'
    And request {"email": "peter@klaven"}
    When method POST
    Then status 400
    And print response

