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
        * **Cross Browser tests:**
            * What is the agreed Browser Matrix? What are the Level 1,2,3 browsers? Will mobile/tablet testing be required?
        * **Usability and Accessibility testing?**
            * Have the designs from UX & Design been signed off by relevant parties, so that the team is aware of how the component should function & look?
                * Does the site macth the look and feel from designs?
            * To what level does the search functionality accessibility need to adhere to?
                * Does the search functionality adhere to the required level?            
        * **Load testing:** 
            * What are the number of page loads expected per minute? How many should be realistically handled?
            * What are the number of search requests expected per minute? How many should be realistically handled?
        * **Performance testing:**
            * What is the expected response time for a page load/search request? What is the maximum time allowed under stress?
        * **Security:**
            * Will a basic OWASP Top 10 check be done on the page, or will this be carried out by a Third Party?
        * **Reliability:**
            * Does the same query return the same result EVERY time?
            * Is the site/page available, and adheres to minimum uptime?
      
            
Depending on the actual scope of the Requirements, there may usually be a need for both static and dynamic testing at Component, Integration, System Integration and User Acceptance levels.

Each of these factors need to be taken into consideration for each Task/Story, each Component & Use Case/Epic.


####1.2 Overview of the approach you took to your testing and why

1. The first step is to clarify the Requirements/Acceptance Criteria. **This step involves static testing.** If there are any minor misunderstandings or ambiguities in the story that is given to the Tech team to implement, it can have a large cost - in terms of time and money.
    1. **Finding and resolving potential issues as early as possible is vitally important on any project.**
2. Once the Requirements are understood by all, then the Tech team need to agree on and understand the apprach to satisfy the requirements - again this is a **static testing phase.**
    1. This is important for the Dev team to know what direction to take during development, and therefore the QA Team knows what to target during testing, anc can write appropriate test cases
3. When development begins, tests need to be written for each of the Acceptance Criteria in order to verify correct functionality 
    1. If automation is to be carried out on the project, writing the manual tests in a Gherkin format will allow the transition from manual to automated scripts easier
4. A Risk Assessment Matrix (Likeliness of Occurance vs Impact) of test cases should be sketchout out in order to determine what order to target testing
    1. The Risk Assessment Matrix also helps clients and layers of management understand the potential bugs or lack of functionality 
5. Based on the Risk Assessment Matrix, and testcases derived from requirements for the task/story, the necessary tests should be carried out against the component
    1. This begins the **dynamic testing** phase, where both Functional and Non-Functional test cases are executed
6. Once all Functional and Non-Functional tests have been completed, the results are collated, and depending on the number of Major to Blocking bugs that may still be open (or possibly don't exist), a report is presented to the Product Owner containing the results, and a decision is made whether to release the component/product, or to defer release while any remaining bugs or functionality are completed
    1. This allows all levels (Tech team, PM, BA, PO) to be fully aware of any bugs that may not be resolved, or any functionality that hasn't been completed. Using the Risk Assessment matrix, a joint descision can be made as to whether the iteration will be released or not


####1.3 Summary of what you tested and why
I would firstly create, and then adhere to the Risk Assessment Matrix, so I would test in the following order:

**API Testing:**
- Verify searches using Phrase matching, wildcards, operators etc return expected results (API testing)
- Verify the phrase or word searched for is returned in the results 
- Verify correct response codes 
- Verify results adhere to the response schema

**Error Handling:**
- Verify 404/500 Response from Search API are handled correctly

**Security:** 
-	Verify adding custom query string (query, facet-discipline, showAll) value is handled gracefully
-	Verify modify query string parameters such as “update, drop, delete, add” do not have any affect on the backend 

**Performance:**
-	Verify the initial page loads under the specified time
-	Verify search results display under the specified time

**Functionality:**
- Verify Search Results are correct against an API 
- Verify the phrase or word search for is in the title if the result type is a book
- Verify the phrase or word searched for is displayed in the results body and is highlighted if the result type is a chapter, article or reference work entry
- Verify the front cover image of the book is displayed 
- Verify the Next/Previous page results button works
- Verify the ability to skip to a different page in results
- Verify the title of the Content Type returned is clickable, and redirects the user to the correct product
- Verify the author of the book returned is clickable, and redirects the user to a page with results showing other titles by the author
- Verify Facet options display according to available options 
- Verify Facets selection update according to the count of available content
- Verify counts of facets equal total search results
- Verify subsequent searches after selecting a facet keep the facet in the search 
- Verify ability to cancel a facet choice 
- Verify the expected error message displays when there are no results for the search
- Verify the “new search” button redirects the user to the /search page, and refreshes all previous search settings
- Verify searches can be actioned either by the search button, or by pressing the “Enter” key
- Verify the “Esc” key clears the contents of the search field
- Verify the “Search Options” button displays the “Advanced Search” and “Search Help” options
- Verify users are taken to the /searchhelp page when “Search Help” is clicked
- Verify the ability of the “Advanced Search” functionality
- Verify Login functionality 
- Verify clicking the English/German language option changes all text on page (except results) to the chosen language
- Verify all style files, and assets load, without any console errors 
- Verify the Corporate and Academic edition options redirect the user to the correct site
- Verify the “Sort By” option works correctly
- Verify the “Date Published” range works correctly
- Verify the “Look Inside” functionality only appears for articles or books that they are available for
- Verify the “Look Inside” opens a modal window that displays contents of the 

**Cross Browser Matrix Tests**
- Verify the functionality works perfectly across all Level 1 browsers, and styling is consistant
- Verify functionality across all Level 2 is the same with Level 1 browsers, with possible styling issues
- Verify basic functionality for Level 3 browsers

**Load:**
-	Verify the page load time is within a specified time with a specified number of concurrent connections

**Accessibility:**
-	Colours are distinguishable and pass the required level of contrast ratio
-	Verify ability to use search field, change facets and access content via keyboard only
-	Verify ability to “Look Inside” content with keyboard only
-	Verify all images have 

