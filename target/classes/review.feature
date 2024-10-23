Feature: Karate Api Test Demo
  Background:
    * def responseBody = read('request1.json')
  Scenario: Get Api
    Given url 'https://reqres.in/api/users/2'
    And request responseBody
    When method POST
    Then status 201
    And print response

