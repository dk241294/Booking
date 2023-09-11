package com.api.automation.runner;

import com.intuit.karate.junit5.Karate;

public class CreateBooking {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("classpath:com/api/automation/feature/createBooking.feature").relativeTo(getClass());
    }

}
