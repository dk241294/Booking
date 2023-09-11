Feature: Generating Authentication Token

  Background:
    * def config = call read('classpath:karate-config.js')
    * url config.baseUrl
    * def healthCheckup = call read('serviceHealth.feature')

  Scenario: Generate Auth Token
    Given path config.authPath
    And request config.authRequestPayload
    When method POST
    Then status 200

  # Validate the Headers
    And match responseHeaders['Server'] contains config.headerValidationRules['Server']
    And match responseHeaders['Connection'] contains config.headerValidationRules['Connection']
    And match responseHeaders['Content-Type'] contains config.headerValidationRules['Content-Type']

  # Validate the Response
    And match response != null
    And match response.token != null

  # Storing the Token
    * def authToken = response.token
    * print 'Auth Token:', authToken
