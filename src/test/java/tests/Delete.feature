Feature: Delete API Demo

  Background:
    * url 'https://reqres.in'
    * header Accept = 'application/json'

  Scenario: Delete Demo 1
    Given path '/api/users/2'
    When method DELETE
    Then status 204
    And print response
    And print responseStatus