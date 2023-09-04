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

# Verify the response with the expected output 
And match response == 
  """ {"firstname":"John",
  "lastname":"Smith",
  "totalprice":111,
  "depositpaid":true,
  "bookingdates":{"checkin":"2018-01-01","checkout":"2019-01-01"},
  "additionalneeds":"Lunch"}
  """
And match each response[*].bookingid == '#number'

# print the response
* print 'Booking Details:', response



  
