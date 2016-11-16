##Springer Nature Task 3


###Assumption: Tests to be completed before a release are executed on a test environment as close to Production as possible.

##3.1 What questions you would ask of the customer to ensure requirements are met
- Does a "Forgotten Password" function already exist, or is this actually a change request?
- What User Account management is used? Is there a 3rd party IdP?
- How does the current "Forgotten Password" function work?
- How are your passwords stored? If they are in plain text, a one-way hash encryption is strontly recommended in order to provide an added layer of security to users
- Over what time period is the user not allowed to use the same password twice? 
- How will the "question/answer prompt" function?
   - If a user chooses to add this functionality:
        - At what point in the user journey will they encounter this prompt? 
        - How do users recover accounts if they forget the answer to their question?
        - How will the question/answer be stored? The Question is Plain text, the Answer is enctypted?
        - Will the answer be case sensitive?
        - What are valid characters, mix/max chars for the question and answer?
- Will the password check be case sensitive? If so... how can this be confirmed if the password is encrypted?
- Can the user enter their own question, or do they need to pick from a set list?
    - If the questions are from a set list, are the questions localised for different languages?
- Can the user disable the question/answer pair?
         
##3.2 What tools/environment setup you may need in order to test this change and how would you come to this decision
**Tools:**
- Ruby/Cucumber/WATIR
- JMeter for load tests

**Environment:**
- An environment that is able to provide user login, access a subset of test data, and allow password reset
- This environment doesn't need to connect to a production User DB, but at least a test DB that would allow QA control of User Accounts (to set accounts in various states - un/activated, deleted)
- The environment should be able to have updated code deployed to it to test updates/bug fixes
 
 
##3.3 What tests you would carry out when this new functionality has been developed
**Regression:**
- Regression test that not having the option for a question/answer prompt still allows users to reset their password

**Functionality:**
- Verify the user is able to set a custom question/answer pair
- Verify when the user is able to click a "Forgotten Password" link or button to start the journey
- Verify that if the user has enabled the custom question/answer pair, that they are prompted at the correct point in time
- Verify that the user is able to reset their password with the custom question/answer pair enabled
- Verify the user cannot enter the same password twice (the time period is to be defined)

**Cross Browser:**
- Verify reset password capability across the Browser Matrix

**Security:**
- Verify question/answer details are not stored insecurely

**Exploratory:**
- If two sessions are opened simultaneously, and both reset the password with different strings at the same time, is an error thrown?
- If two sessions are opened simultaneously, and both add a different question/answer pair, is an error thrown?
 
**Accessibility:**
- Can a user add a question/answer pair using just their keyboard?
- Do all elements in the reset password journey contain correct "alt" tags and descriptions?