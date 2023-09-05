Feature: Check Fields with negative scenario

Background:
    * def config = call read('classpath:karate-config.js')
    * url config.baseUrl
    * header Content-Type = 'application/json'
    * header Accept = 'application/json'
    * header Authorization = config.defaultAuthToken
Scenario: validate if first Name field cannot be empty
  Given path '/booking'
  And request
    """
    {
      "firstname":'',
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
  * print 'Your data is invalid. Please check and try again.First name field cannot be empty'
  And match responseStatus == 400

Scenario:validate if totalprice field cannot be 0
  Given path '/booking'
  And request
    """
    {
      "firstname":'',
      "lastname": "Brown",
      "totalprice": 0,
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
  * print 'Your data is invalid. Please check and try again.Total price cannot be zero'
  And match responseStatus == 400
 


Scenario:validate if totalprice field cannot be negative
    Given path '/booking'
    And request
      """
      {
        "firstname":'',
        "lastname": "Brown",
        "totalprice": -10,
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
    * print 'Your data is invalid. Please check and try again.Total price cannot be negative'
    And match responseStatus == 400
Scenario: validate if date field format cannot be other than CCYY-MM-DD
    Given path '/booking'
    And request
      """
      {
        "firstname":'',
        "lastname": "Brown",
        "totalprice": -10,
        "depositpaid": true,
        "bookingdates": {
          "checkin": "20334-041-01",
          "checkout": "2019-0341-01"
        },
        "additionalneeds": "Breakfast"
      }
      """
    When method POST
    Then status 200
    * print 'Your data is invalid. Please check and try again.Date field should follow this format CCYY-MM-DD'
    And match responseStatus == 400
Scenario: validate if checkin date cannot be empty
    Given path '/booking'
    And request
      """
      {
        "firstname":'',
        "lastname": "Brown",
        "totalprice": -10,
        "depositpaid": true,
        "bookingdates": {
         "checkin": "",
          "checkout": "2019-0341-01"
        },
        "additionalneeds": "Breakfast"
      }
      """
    When method POST
    Then status 200
    * print 'Your data is invalid. Please check and try again.checkin date  should not be empty'


Scenario: validate if user should not be able to create booking with all the filed with empty data
    Given path '/booking'
    And request
      """
      {
        "firstname":'',
        "lastname": "",
        "totalprice": ,
        "depositpaid": ,
        "bookingdates": {
         "checkin": "",
          "checkout": ""
        },
        "additionalneeds": ""
      }
      """
    When method POST
    Then status 200
    * print 'Your data is invalid. Please check and try again.firstname, totalprice and checkin field can\'t be empty'
    And match responseStatus == 400
    

Scenario: validate the response with empty request body 
    Given path '/booking'
    And request
      """
      {
        
      }
      """
    When method POST
    Then status 500
    * print 'Your data is invalid. Please check and try again.firstname, totalprice and checkin field can\'t be empty'
    And match responseStatus == 400
    