# Booking API Automation using Karate Framework

## Introduction
This repository contains automated tests for a Booking API using the Karate framework. Karate is a powerful tool for API testing, and this guide will help you get started with running the tests and generating reports.

## Prerequisites
Before you begin, make sure you have the following prerequisites installed:

- Java Development Kit
- Maven

## Getting Started
Follow these steps to start running the tests:

1. Clone [this](https://github.com/dk241294/Booking/tree/main) repository to your local machine.

2. Open the project using a text editor or Java IDE of your choice.

3. Run the tests using the Karate runner classes located under the 'src/test/java/com/api/automation/runner' folder.

   For JUnit 5 integration, refer to [Karate's JUnit 5 documentation](https://github.com/karatelabs/karate#junit-5) for details on how to run tests using JUnit 5.

   Alternatively, you can also install the Karate plugin from your IDE's marketplace, open any feature file, and click the run button.

## Test Reports
After running the tests, a test report is automatically generated in the 'target' folder. Here's how you can access different reports:

- Karate Default Report: View the Karate default report by opening 'target/karate-reports/karate-summary.html' in your browser.

- Cucumber Report: If you prefer Cucumber-style reports, you can find them in 'target/cucumber-html-reports/overview-features.html'. Open this file in your browser to see the test results in a Cucumber-style format.

## Conclusion
With the Karate framework, you can easily automate and test your Booking API. This readme provides a quick guide to get you started with running the tests and viewing the reports. For more detailed information, refer to the [Karate documentation](https://github.com/karatelabs/karate#index).

