Feature: CRUD for Booking feature

  Background:
    * def config = call read('classpath:karate-config.js')
    * def Booking = callonce read('createBooking.feature')
    * url config.baseUrl
    * header Authorization = config.defaultAuthToken
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    * def BookingId = Booking.response.bookingid
    * def updatePayload =  read('classpath:updateBookingPayload.json')

  Scenario:
 # Read the payload from the JSON file
    Given path config.updateBookingPath, BookingId
    And request updatePayload
    When method PUT
    Then status 200
    * print BookingId
  Scenario:
  # Delete the created booking
    * print "Booking id for which will be deleted ", BookingId
    Given path config.deleteBookingPath, BookingId
    When method DELETE
    Then status 201
  Scenario:
 # Verify that the booking is deleted
    Given path config.bookingPath, BookingId
    When method GET
    Then status 404