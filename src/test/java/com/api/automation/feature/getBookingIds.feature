Feature: Get all bookings

  Background:
    * def config = call read('classpath:karate-config.js')
    * def healthCheckup = call read('serviceHealth.feature')
    * url config.baseUrl
    * def healthCheckup = callonce read('serviceHealth.feature')
  @Smoke
  Scenario: Get All Bookings
    Given path config.bookingPath
    When method GET
    Then status 200
    * def responseData = response
    * print 'Booking Details:', responseData
    And match response == '#array'
    And match each response[*].bookingid == '#number'
@Sanity
  Scenario: Get Booking IDs by Firstname and Lastname
    Given path config.bookingPath
    And param firstname = config.queryParameters.firstname
    And param lastname = config.queryParameters.lastname
    When method GET
    Then status 200
    * def responseData = response
    * print 'Booking Details:', responseData
    * print 'Booking IDs with Query parameter of first name and last name ', responseData
    And match response == '#array'
    And match each response[*].bookingid == '#number'
    And match each response[*].firstname == config.queryParameters.firstname
    And match each response[*].lastname == config.queryParameters.lastname

  Scenario: Get Booking IDs with Query Parameters checkin and checkout
    Given path config.bookingPath
    And param checkin = config.queryParameters.checkin
    And param checkout = config.queryParameters.checkout
    When method GET
    Then status 200
    * def responseData = response
    * print 'Booking Details:', responseData
    * print 'response', responseData
    And match response == '#array'
    And match each response[*].bookingid == '#number'
    * print response.length
    * print 'Booking IDs with Query parameter of checkin and checkout ', responseData

