# springernature
###Springer Nature - QA assessment


The answers for each task are in the .MD files named accordingly.

In order to run the tests in Task1, you should be able to:
- bundle install

There are a couple of variations to the test:
- browser: firefox or chrome (depending on if you have the correct drivers)
- brand: SpringerLink or BioMedCentral  
- env: keep as prod

e.g. cucumber -t @happy,@unhappy env=prod browser=firefox brand=BioMedCentral


###Notes:
- Using 'eval' allows the code to remain compact and reduces the number of step definitions required dramatically
- A Rake file can be used to run all the various combinations of tags, brands, environments & browsers
- The expected results should be returned from a search API call instead of being hard coded in the code