package com.api.automation;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

public class TestRunner {

    @Test
    public void testParallel() {
        // Clean up the existing report files
        cleanUpReports();

        // Run Karate tests and save the results
        Results results = Runner.path("classpath:com/api/automation/feature")
                .outputCucumberJson(true)
                .parallel(1);
        // Generate the Cucumber report
        generateCucumberReport(results.getReportDir());
    }

    private void cleanUpReports() {
        File reportDirectory = new File("target/cucumber-html-reports/");
        if (reportDirectory.isDirectory()) {
            File[] reportFiles = reportDirectory.listFiles();
            if (reportFiles != null) {
                for (File reportFile : reportFiles) {
                    System.out.println("Deleting file: " + reportFile);
                    FileUtils.deleteQuietly(reportFile);
                }
            }
        }
    }

    private void generateCucumberReport(String reportDir) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(reportDir), new String[]{"json"}, true);
        List<String> jsonPaths = jsonFiles.stream().map(File::getAbsolutePath).collect(Collectors.toList());

        Configuration config = new Configuration(new File("target"), "Booking");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
