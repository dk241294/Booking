@Smoke
Feature: Health Check - Verify Service Status

  Background:
    * def config = call read('classpath:karate-config.js')
    * url config.baseUrl
  @Sanity
  Scenario: Verify Service Health Status
    Given path config.healthCheckPath
    When method get
    Then status 201
    * def response = response
    * print 'Response: ', response
    * def healthCheckStatus = responseStatus
    * print 'Health Status code: ', healthCheckStatus

  # Validate the Service
    * if (healthCheckStatus != config.expectedHealthStatus) karate.fail('Service is down. Please check...')
    * print 'Service is UP!!!', healthCheckStatus

    # Validate the Headers
    And match responseHeaders['Server'] contains config.headerValidationRules['Server']
    And match responseHeaders['Connection'] contains config.headerValidationRules['Connection']
    And match responseHeaders['Content-Type'] contains "text/plain; charset=utf-8"


