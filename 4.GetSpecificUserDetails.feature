Feature: Booking Details of Specifc user Id 

Background:
  * def config = call read('classpath:karate-config.js')
  * url config.baseUrl
  * header Accept = 'application/json'
  * def healthCheckup = callonce read('1.HealthCheckup.feature')

Scenario: Get Booking Details
  Given path '/booking', config.bookingId
  When method GET
  Then status 200

  # vaidate the response 
  And match response == 
  """{
    firstname: '#string',
    lastname: '#string',
    totalprice: '#number',
    depositpaid: '#boolean',
    bookingdates: {
      checkin: '#string',
      checkout: '#string'
    },
    additionalneeds: '#string'
  }"""


And match each response[*].bookingid == '#number'

# print the response
* print 'Booking Details:', response



  
