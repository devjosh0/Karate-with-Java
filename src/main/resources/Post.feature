Feature: Post API Demo
   Background:
     * url 'https://reqres.in/api'
     * def expectedOutput = read('response1.json')

  # Simple Post request
  Scenario: Post Demo 1, Simple Post request
    Given url 'https://reqres.in/api/users'
    And request {"name": "Hussein","job": "QA"}
    When  method POST
    Then status 201
    Then print response

    # Post with Background
  Scenario: Post Demo 2, Post with Background
    Given path '/users'
    And request {"name": "Hussein","job": "QA"}
    When  method POST
    Then status 201
    Then print response

    # Post with Assertions
  Scenario: Post Demo 3, Post with Assertions
    Given path '/users'
    And request {"name": "Hussein","job": "QA"}
    When  method POST
    Then status 201
    Then match response == {"name": "Hussein","job": "QA","id": "#string","createdAt": "#ignore"}


      # Post with read responses from file
  Scenario: Post Demo 4, Post with assertion by  reading  from file
    Given path '/users'
    And request {"name": "Hussein","job": "QA"}
    When  method POST
    Then status 201
    Then match response == expectedOutput
    And print response


        # Post with read responses from file in the same folder
  Scenario: Post Demo 5, Post with read request body from file in the same folder
    Given path '/users'
    And def requestBody = read('request1.json')
    And request requestBody
    When  method POST
    Then status 201
    And print response


         # Post with read responses from file in the different folder
  Scenario: Post Demo 6, Post with read request body from file in different folder
    Given path '/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def filePath = projectPath + '/src/main/java/org/example/DataFiles/request1.json'
    And print filePath
    And def requestBody = filePath
    And request requestBody
    When  method POST
    Then status 201
    And print response


         # Post with read responses from file in the same folder, But also can change the Value
  Scenario: Post Demo 7, Post with read request body from file in the same folder, But also can change the Value
    Given path '/users'
    And def requestBody = read('request1.json')
    And set requestBody.job = 'engineer'
    And request requestBody
    When  method POST
    Then status 201
    And print response




