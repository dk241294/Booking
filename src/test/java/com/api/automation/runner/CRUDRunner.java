package com.api.automation.runner;

import com.intuit.karate.junit5.Karate;

public class CRUDRunner {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("classpath:com/api/automation/feature/crud_booking.feature").relativeTo(getClass());
    }
}
