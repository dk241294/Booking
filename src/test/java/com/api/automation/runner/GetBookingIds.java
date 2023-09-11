package com.api.automation.runner;

import com.intuit.karate.junit5.Karate;

public class GetBookingIds {
    @Karate.Test
    Karate testUsers() {
        return Karate.run("classpath:com/api/automation/feature/getBookingIds.feature").relativeTo(getClass());
    }

}
