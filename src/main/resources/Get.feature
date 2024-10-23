Feature: Get API Demo
  # Background runs before the scenarios
  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario: Get Demo 1
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseCookies

   # Get with Background
  Scenario: Get Demo 2 with background
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response

  # Get with Background and param
  Scenario: Get Demo 3 with background
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response

  # Get with Assertions
  Scenario: Get Demo 4 with background
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.data[0].first_name != null
    And match response.data[4].last_name == 'Edwards'


