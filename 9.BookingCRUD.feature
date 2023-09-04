Feature: CRUD for Booking feature

Background:
  * def config = call read('classpath:karate-config.js')
  * def Booking = callonce read('5.CreateBooking.feature')
  * url config.baseUrl
  * header Authorization = config.defaultAuthToken
  * header Content-Type = 'application/json'
  * header Accept = 'application/json'
  * def BookingId = Booking.response.bookingid

Scenario: 
   # Update the booking
 Given path '/booking/' + BookingId
 And header Accept = 'application/json'
 And request 
 """{
   "firstname": "Updated John",
   "lastname": "Updated Doe",
   "totalprice": 200,
   "depositpaid": false,
   "bookingdates": {
     "checkin": "2023-09-10",
     "checkout": "2023-09-15"
   },
   "additionalneeds": "Updated Needs"
 }"""
 When method PUT
 Then status 200   
  * print BookingId
Scenario:
  # Delete the created booking
  * print "Booking id for which will be deleted ", BookingId
 Given path '/booking', BookingId
 When method DELETE
 Then status 201 
Scenario:
 # Verify that the booking is deleted
 Given path '/booking', BookingId
 When method GET
 Then status 404   