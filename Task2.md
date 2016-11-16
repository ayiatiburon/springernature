#Springer Nature Task 2


##Assumption: Tests to be completed before a release are executed on a test environment as close to Production as possible.

####2.1 Explain how woud you define your test automation strategy (including test types) considering that the team wants to be able to release multiple times a day

I would have the tests split into 3 differnt frameworks, so that they can be run (mostly) simultaneously:
- API Tests
- UI Tests
- Load Tests

####API Tests
- These tests would query the Search API directly, ensuring that:
    - Correct response codes for each endpoint are returned for various calls (normally 200) and that negative tests either return 200 response with 0 results, or potentially a 401 (unauthorised) or 404 (not found) error depending on the test
    - The response content adheres to the response schema
   
####UI Tests 
- While the API tests are running, the UI Tests can be run cross browser - multiple Selenium hubs which will allow parallel tests will help reducing the time for tests to run
- Before a release, sanity checks can be run instead of a full suite of tests, in order to provide confidence that the site is functioning as expected
- UI Tests would contain:
  - Functional Tests (click on Search field, enter word/string, click button, verify results against API results etc)
  - Cross Browser tests (level 1 browsers)
  - Image Regession tests to verify styling has not broken
- Arachni can be run for security (if required before release)
- Pa11y can be run for accessibility (if required before release)
  
####Load Tests
- Hitting the page with the max concurrent users either with JMeter, or perhaps even perform a simple ab benchmark check 