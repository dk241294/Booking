Feature: Update Booking API

Background:
    * def config = call read('classpath:karate-config.js')
    * def Booking = callonce read('5.CreateBooking.feature')
    * url config.baseUrl
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    * header Authorization = config.defaultAuthToken
    * def createdBookingId = Booking.response.bookingid

Scenario: Update Booking - FirstName
    * print "createdBookingId",createdBookingId
    * def updatedBooking = { "firstname": "UpdatedFirstName" }
    Given path 'booking', createdBookingId
    And request updatedBooking
    When method PATCH
    Then status 200
    * def bookingUpdated = response
    * print bookingUpdated
  
Scenario: Update Booking and Validate with GET
    Given path '/booking', createdBookingId
    When method GET
    Then status 200
    And match response.firstname == "UpdatedFirstName"

Scenario: Update Booking - lastName
    * print "createdBookingId",createdBookingId
    * def updatedBooking = { "lastname": "UpdatedLastName" }
    Given path 'booking', createdBookingId
    And request updatedBooking
    When method PATCH
    Then status 200
    * def bookingUpdated = response
    * print bookingUpdated

Scenario: Update Booking and Validate with GET
    Given path '/booking', createdBookingId
    When method GET
    Then status 200
    And match response.lastname == "UpdatedLastName"


Scenario: Update Booking - total price
    * print "createdBookingId",createdBookingId
    * def updatedBooking = { "totalprice": 1000 }
    Given path 'booking', createdBookingId
    And request updatedBooking
    When method PATCH
    Then status 200
    * def bookingUpdated = response
    * print bookingUpdated

Scenario: Update Booking and Validate with GET
    Given path '/booking', createdBookingId
    When method GET
    Then status 200
    And match response.totalprice == 1000

Scenario: Update Booking - deposit paid
    * print "createdBookingId",createdBookingId
    * def updatedBooking = { "depositpaid": false }
    Given path 'booking', createdBookingId
    And request updatedBooking
    When method PATCH
    Then status 200
    * def bookingUpdated = response
    * print bookingUpdated

Scenario: Update Booking and Validate with GET
    Given path '/booking', createdBookingId
    When method GET
    Then status 200
    And match response.depositpaid == false

Scenario: Update Booking - Booking dates
    * print "createdBookingId",createdBookingId
    * def updatedBooking =
     """{ 
        "bookingdates": {
        "checkin": "2023-01-01",
        "checkout": "2023-03-01"
      } 
      }"""
    Given path 'booking', createdBookingId
    And request updatedBooking
    When method PATCH
    Then status 200
    * def bookingUpdated = response
    * print bookingUpdated

Scenario: Update Booking and Validate with GET
    Given path '/booking', createdBookingId
    When method GET
    Then status 200
    And match response.bookingdates.checkin == "2023-01-01"
    And match response.bookingdates.checkout == "2023-03-01"

Scenario: Update Booking - Additional needs
    * print "createdBookingId",createdBookingId
    * def updatedBooking = { "additionalneeds": "lunch" }
    Given path 'booking', createdBookingId
    And request updatedBooking
    When method PATCH
    Then status 200
    * def bookingUpdated = response
    * print bookingUpdated

Scenario: Update Booking and Validate with GET
    Given path '/booking', createdBookingId
    When method GET
    Then status 200
    And match response.additionalneeds == "lunch"