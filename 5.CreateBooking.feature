Feature: Create new Booking

Background:
  * def config = call read('classpath:karate-config.js')
  * url config.baseUrl
  * header Content-Type = 'application/json'
  * header Accept = 'application/json'
  * def healthCheckup = callonce read('1.HealthCheckup.feature')

Scenario: Create Booking

  Given path '/booking'
  And request
    """
    {
      "firstname": "Jim",
      "lastname": "Brown",
      "totalprice": 111,
      "depositpaid": true,
      "bookingdates": {
        "checkin": "2034-01-01",
        "checkout": "2019-01-01"
      },
      "additionalneeds": "Breakfast"
    }
    """
  When method POST
  Then status 200

  # vaidate the response 
  And match response == 
 """{
  bookingid: '#number',
  booking: {
    firstname: '#string',
    lastname: '#string',
    totalprice: '#number',
    depositpaid: '#boolean',
    bookingdates: {
      checkin: '#string',
      checkout: '#string'
    },
    additionalneeds: '#string'
  }
}"""
  # Verify the response with the expected output 
  And match response == 
  """{
    bookingid: '#number',
    booking: {
      firstname: 'Jim',
      lastname: 'Brown',
      totalprice: 111,
      depositpaid: true,
      bookingdates: {
        checkin: '2034-01-01',
        checkout: '2019-01-01'
      },
      additionalneeds: 'Breakfast'
    }
  }"""
  And match response.bookingid == '#number'
  * print "Booking Details: ", response
  * def createdBookingId = response.bookingid
  * print 'Your Booking ID is :', createdBookingId
 
  