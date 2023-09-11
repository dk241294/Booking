  function fn() {
    var config = {
      baseUrl: 'https://restful-booker.herokuapp.com',
      defaultAuthToken:'Basic YWRtaW46cGFzc3dvcmQxMjM=',

       // ----------------------------Health path--------------------------
      healthCheckPath: '/ping',
      expectedHealthStatus: 201,
       // ----------------------------Authentication path--------------------
      authPath: '/auth',
      //---------------------------- Booking path----------------------------
      bookingPath: '/booking',
      // ----------------------------Update Booking path --------------------
      updateBookingPath: '/booking',
      // ----------------------------Delete Booking path ---------------------
      deleteBookingPath: '/booking',
      expectedStatus: 200,

      authRequestPayload: {
        "username": "admin",
        "password": "password123"
        
      },
      queryParameters: {
        firstname: 'Sally',
        lastname: 'Brown',
        checkin: "2018-01-01",
        checkout: "2019-01-01"
      },
      headerValidationRules: {
        'Server': 'Cowboy',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json; charset=utf-8',
      },

    };
    return config;
  }
  