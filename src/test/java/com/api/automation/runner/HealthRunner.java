package com.api.automation.runner;

import com.intuit.karate.junit5.Karate;

class HealthRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("classpath:com/api/automation/feature/serviceHealth.feature").relativeTo(getClass());

    }    

}
