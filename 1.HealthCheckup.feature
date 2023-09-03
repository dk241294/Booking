Feature: Health Check  Whether  service is up or down

Background:
  * def config = call read('classpath:karate-config.js')
  * url config.baseUrl

Scenario: Check API Health
  Given path 'ping'
  When method get
  Then status 201
  * def response = response  
  * match response == 'Created'
  * print 'response : ' , response
  * def healthCheckStatus = responseStatus
  * print "Health Status code : ", responseStatus

  # validate the Service 
  * if (healthCheckStatus != 201) karate.fail('Service is down.Please check...')
  * print "Service is UP !!!" , healthCheckStatus

  #validate the Headers
  And match responseHeaders['Server'] contains 'Cowboy'  
  And match responseHeaders['Connection'] contains 'keep-alive'  
  And match responseHeaders['Content-Type'] contains 'text/plain; charset=utf-8'  
  