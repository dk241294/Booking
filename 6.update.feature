Feature: Update the booking Details

Background:
  * def config = call read('classpath:karate-config.js')
  * def Booking = callonce read('5.CreateBooking.feature')
  * url config.baseUrl
  * header Authorization = config.defaultAuthToken
  * header Content-Type = 'application/json'
  * header Accept = 'application/json'
  * def createdBookingId = Booking.response.bookingid


Scenario: Update the Booking details
  * print "Booking id for which booking details will be updated", createdBookingId
 Given path '/booking/' + createdBookingId
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
Scenario: Validate the updated booking using the captured booking ID
 Given path '/booking', createdBookingId
 When method GET
 Then status 200
 And match response.firstname == 'Updated John'
 And match response.lastname == 'Updated Doe'
 And match response.totalprice == 200
 And match response.depositpaid == false
 And match response.bookingdates.checkin == '2023-09-10'
 And match response.bookingdates.checkout == '2023-09-15'
 And match response.additionalneeds == 'Updated Needs'
