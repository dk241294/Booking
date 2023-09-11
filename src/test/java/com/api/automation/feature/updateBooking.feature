Feature: Update the booking Details

  Background:
    * def config = call read('classpath:karate-config.js')
    * def Booking = callonce read('createBooking.feature')
    * url config.baseUrl
    * header Authorization = config.defaultAuthToken
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    * def createdBookingId = Booking.response.bookingid

  Scenario: Update the Booking details
    * print "Booking id for which booking details will be updated", createdBookingId
    Given path config.updateBookingPath , createdBookingId
    And header Accept = 'application/json'

  # Read the payload from the JSON file
    * def updatePayload = read('classpath:updateBookingPayload.json')

  # Use the payload in the request
    And request updatePayload
    When method PUT
    Then status 200

  Scenario: Validate the updated booking using the captured booking ID
    Given path config.updateBookingPath , createdBookingId
    When method GET
    Then status 200
    * def updatedBooking = read('classpath:updateBookingPayload.json')
    * print response
    #Validating the updated booking
    And match response == updatedBooking

  # Validate the Headers
    And match responseHeaders['Server'] contains config.headerValidationRules['Server']
    And match responseHeaders['Connection'] contains config.headerValidationRules['Connection']
    And match responseHeaders['Content-Type'] contains config.headerValidationRules['Content-Type']

