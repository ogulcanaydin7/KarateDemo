Feature: Put API Demo

  Background:
    * url 'https://reqres.in'
    * header Accept = 'application/json'

  Scenario: Put Demo 1
    Given path '/api/users/2'
    And request {"name": "Santos","job": "former coach"}
    When method PUT
    Then status 200
    And print response
    And print responseStatus
