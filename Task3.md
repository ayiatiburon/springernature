#Springer Nature Task 1

###Assumption: The answers for this task are using the assumption and POV that a QA presence is present from the beginning of development on the Search Functionality.  

####1.1 What considerations would you take into account to ensure the overall quality of the area under test

The first objective is to define what is the actual "Area Under Test" for this story:
- Are we testing only the "search field" and button?
- Are we testing the facets, and "Advanced Search"? 
- Do we need to take into account a separate database of titles/resources once a user has logged in?

Once the components to be tested have been defined, the overall scope has to be clarified:
- What are the Functional Requirements?
    * Are there any ambiguities in the Requirements?
    * Has the BA correctly identified the Requrements from the Product Owner?
    * Have each of the Acceptance Criteria been explained to, and understood by BA, Dev (front and backend) and QA?
    * Is there an API or "source of truth" that can be used to verify the correct search results are displayed in the result section?
- Will any Non-Functional testing be required for this iteration? 
    * If so, will the tests indlude:
        * **Usability and Accessibility testing?**
            * Have the designs from UX & Design been signed off by relevant parties, so that the team is aware of how the component should function & look?
            * To what level does the search functionality accessibility need to adhere to?            
        * **Load testing:** 
            * What are the number of page loads expected per minute? How many should be realistically handled?
            * What are the number of search requests expected per minute? How many should be realistically handled?
        * **Performance testing:**
            * What is the expected response time for a page load/search request? What is the maximum time allowed under stress?
        * **Security:**
            * Will a basic OWASP Top 10 check be done on the page, or will this be carried out by a Third Party?

Depending on the actual scope of the Requirements, there may will usually be a need for both static and dynamic testing at Component, Integration, System Integration and User Acceptance levels.

Each of these factors need to be taken into consideration for each Task/Story, each Component & Use Case/Epic.
####1.2 Overview of the approach you took to your testing and why

1. The first step is to clarify the Requirements/Acceptance Criteria. **This step involves static testing.** If there is any minor misunderstanding or ambiguity in the story that is given to the Tech team to implement, it can have a large cost - in terms of time and money.
   1. **Finding and resolving potential issues as early as possible is vitally important on any project.**
2. Once the Requirements are understood by all, then the tech team need to agree on and understand the apprach to satisfy the requirements - again this is a **static testing phase.**
3. When development begins, tests need to be written for each of the Acceptance Criteria in order to verify correct functionality 
    1. If automation is to be carried out on the project, writing the manual tests in a Gherkin format will allow the transition from manual to automated scripts easier
4. A Risk Assessment matrix (Likeliness of Occurance vs Impact) of test cases should be sketchout out in order to determine what order to target testing  
5. Based on the Risk Assessment Matrix, and testcases derived from requirements for the task/story, the necessary tests should be carried out against the component
6. Once all Functional and Non-Functional tests have been completed, the results are collated, and depending on the number of Major to Blocking bugs that may still be open (or possibly don't exist), a report is presented to the Product Owner containing the results, and a decision is made whether to release the component/product, or to defer release while any remaining bugs or functionality are completed 




