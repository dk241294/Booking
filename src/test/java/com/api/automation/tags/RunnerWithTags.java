package com.api.automation.tags;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

public class RunnerWithTags {

    @Test
    void testSample() {
        Results results = Runner.path("classpath:com/api/automation/feature")
                .tags("@Smoke") // Specify the tag(s) you want to run
                .parallel(4) ;// Number of parallel threads


        // Check if any tests failed
        if (results.getFailCount() > 0) {
            throw new AssertionError("Karate tests failed");
        }
    }
}
