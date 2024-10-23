Feature: Demo Api
  Background:
    * url 'https://reqres.in/api'
  Scenario: Get Api
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And def filePath = projectPath + 'src\main\java\org\example\DataFiles\request1.json'
    And def requestBody = filePath
    And set requestBody.job = 'engineer'
    And request requestBody
    When method POST
    Then status 201
    And print response
    And match response == {"name": "Hussein","job": "engineer","id": "#string","createdAt": "#ignore"}