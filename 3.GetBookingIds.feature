Feature: Get all bookings

Background:
  * def config = call read('classpath:karate-config.js')
  * url config.baseUrl
  * def healthCheckup = callonce read('1.HealthCheckup.feature')

Scenario: Get All Bookings
  Given path '/booking'
  When method GET
  Then status 200
  * def responseData = response
  * print 'Booking Details:', responseData
  And match response == '#array'
  And match each response[*].bookingid == '#number'


Scenario: Get Booking IDs by Firstname and Lastname
    Given path '/booking'
    And param firstname = 'Sally'
    And param lastname = 'Brown'
    When method GET
    Then status 200
    * def responseData = response
    * print 'Booking Details:', responseData
    * print "response",responseData
    And match response == '#array'
    And match each response[*].bookingid == '#number'
    And match each response[*].firstname == 'Sally'
    And match each response[*].lastname == 'Brown'
  
Scenario: Get Booking IDs with Query Parameters checkin and checkout
  Given path '/booking'
  And param checkin = '2023-07-14'
  And param checkout = '2023-09-05'
  When method GET
  Then status 200
  * def responseData = response
  * print 'Booking Details:', responseData
  * print 'response', responseData
  And match response == '#array'
  And match each response[*].bookingid == '#number'
  * print response.length
  And assert response.length >= 1
