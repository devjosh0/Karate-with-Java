Feature: Put API Demo
  Background:
    * url 'https://reqres.in/api'
    * def putResponseBody = read('putResponse.json')
  # Simple Put request
  Scenario: Put Demo 1
    Given url 'https://reqres.in/api/users/2'
    And request {  "name": "morpheus","job": "zion resident"}
    When  method PUT
    Then status 200
    And print response

# With Background
  Scenario: Put Demo 2, With Background
    Given path '/users/2'
    And request {  "name": "morpheus","job": "zion resident"}
    When  method PUT
    Then status 200
    And print response

# Put with assertions
  Scenario: Put Demo 3, With Background with assertions
    Given path '/users/2'
    And request {  "name": "morpheus","job": "zion resident"}
    When  method PUT
    Then status 200
    And match response == {"name": "morpheus","job": "zion resident","updatedAt": "#ignore"}
    And print response


  # Put with read from request file in the same folder
  Scenario: Put Demo 4, With read from request file in the same folder
    Given path '/users/2'
    And def putResponseBody = read('putrequest.json')
    And request putResponseBody
    When  method PUT
    Then status 200
    And match response == {"name": "morpheus","job": "zion resident","updatedAt": "#ignore"}
    And print response


    # Put with assert from using a file in the same folder
  Scenario: Put Demo 5, assert from using a file in the same folder
    Given path '/users/2'
    And request {"name": "morpheus","job": "zion resident"}
    When method PUT
    Then status 200
    And match response == putResponseBody
    And print response

      # Put with assert from using a file in another folder
  Scenario: Put Demo 6, with read from request file in another folder
    Given path '/users/2'
    And def projectPath = karate.properties['user.dir']
    And def filePath = projectPath + '/src/main/java/org/example/DataFiles/putResponse.json'
    And def requestBody = filePath
    When method PUT
    Then status 200
    And print response


