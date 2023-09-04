Feature: Authentication Token API

Background:
  * def config = call read('classpath:karate-config.js')
  * url config.baseUrl
  * header Content-Type = 'application/json'
  * def healthCheckup = call read('1.HealthCheckup.feature')

Scenario: Generate Auth Token
  Given path '/auth'
  And request
    """
    {
      "username": "admin",
      "password": "password123"
    }
    """
  When method POST
  Then status 200
  
#validate the Headers
  And match responseHeaders['Server'] contains 'Cowboy'  
  And match responseHeaders['Connection'] contains 'keep-alive'  
  And match responseHeaders['Content-Type'] contains 'application/json; charset=utf-8'  

# Validate the response 
  And match response != null
  And match response.token != null
  And match responseType == '#string'


 # storing the token
  * def authToken = response.token
  * print 'Auth Token:', authToken


  

 