Feature: Delete Booking
  Background:
    * def config = call read('classpath:karate-config.js')
    * def Booking = callonce read('createBooking.feature')
    * url config.baseUrl
    * header Authorization = config.defaultAuthToken
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    * def BookingId = Booking.response.bookingid
  Scenario:
 # Deleting the created booking
    * print "Booking id for which will be deleted ", BookingId
    Given path config.deleteBookingPath , BookingId
    And header Authorization =  config.defaultAuthToken
    When method DELETE
    Then status 201
    And match response == 'Created'

  Scenario:
 # Verify that the booking is deleted
    Given path config.deleteBookingPath ,BookingId
    When method GET
    Then status 404
    And match response == 'Not Found'
    * print response

     # Validate the Headers
    And match responseHeaders['Server'] contains config.headerValidationRules['Server']
    And match responseHeaders['Connection'] contains config.headerValidationRules['Connection']
    And match responseHeaders['Content-Type'] contains "text/plain; charset=utf-8"


