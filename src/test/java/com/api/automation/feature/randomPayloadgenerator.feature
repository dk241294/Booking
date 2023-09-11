Feature: Random Data Generation

  Background:
    * def firstNames = ['John', 'Alice', 'Michael', 'Sarah', 'David']
    * def lastNames = ['Smith', 'Johnson', 'Brown', 'Davis', 'Wilson']

    * def randomFirstName = firstNames[Math.floor(Math.random() * firstNames.length)]
    * def randomLastName = lastNames[Math.floor(Math.random() * lastNames.length)]
    * def randomTotalPrice = Math.floor(Math.random() * 1000)
    * def randomDepositPaid = Math.random() < 0.5
    * def randomCheckinYear = 10 + Math.floor(Math.random() * 10)
    * def randomCheckoutYear = 11 + Math.floor(Math.random() * 10)
    * def randomCheckin = "20" + randomCheckinYear + "-01-01"
    * def randomCheckout = "20" + randomCheckoutYear + "-01-01"
    * def randomPayload =
    """
    {
      "firstname": "#(randomFirstName)",
      "lastname": "#(randomLastName)",
      "totalprice": #(randomTotalPrice),
      "depositpaid": #(randomDepositPaid),
      "bookingdates": {
        "checkin": "#(randomCheckin)",
        "checkout": "#(randomCheckout)"
      },
      "additionalneeds": "Breakfast"
    }
    """
Scenario:
  * print randomPayload