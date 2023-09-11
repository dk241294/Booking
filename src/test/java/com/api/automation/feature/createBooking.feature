Feature: Create new Booking

  Background:
    * def config = call read('classpath:karate-config.js')
    * def healthCheckup = call read('serviceHealth.feature')
    * url config.baseUrl
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    * def payload = callonce read('randomPayloadgenerator.feature')
    * def requestbody = payload.randomPayload

  Scenario: Create Booking with Random Data
    Given path config.bookingPath
    When request requestbody
    Then method post
    And status 200

  # Validate the response
    And match response.bookingid == '#number'
    * print "Booking Details: ", response
    * def createdBookingId = response.bookingid
    * print 'Your Booking ID is :', createdBookingId
    * def createdBookingDetail = response.booking
    And match requestbody == createdBookingDetail


 # Validate the Headers
    And match responseHeaders['Server'] contains config.headerValidationRules['Server']
    And match responseHeaders['Connection'] contains config.headerValidationRules['Connection']
    And match responseHeaders['Content-Type'] contains config.headerValidationRules['Content-Type']






