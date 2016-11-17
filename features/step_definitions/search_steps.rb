Given (/^I am on the (.*?) page$/) do |page|
  page_object = "#{page} page".camelcase(:upper)
  @current_page = eval("#{ENV['brand']}::#{page_object}.new(@browser)")
  @browser.goto @current_page.get_url
end

When (/^I click on the (.*)$/) do |page_element|
  element_name = page_element.snakecase
  eval("@current_page.#{element_name}_element.click")
end

When (/^I enter (.*?) into the (.*)$/) do |text, page_element|
  element_name = page_element.snakecase
  eval(%Q{@current_page.#{element_name} = "#{text}"})
end

Then (/^I should be on the (.*?) page$/) do |page|
  page_object = "#{page} page".camelcase(:upper)
  @expected_page = eval("#{ENV['brand']}::#{page_object}.new(@browser)")
  sleep 1
  expect(@browser.url).to include(@expected_page.get_url)
  @current_page = @expected_page
end

Then (/^I should see the expected total results and number of results on the page for (.*)$/) do |search_text|
  #This step should ideally be calling an API for the search results, so that we can compare the expected and actual results
  expected_results = {
      'prod' => {
          'SpringerLink' => {
              'nature' => {
                  'page_results' => 20,
                  'total_results' => 2941274
              },
              '\"rock and roll was in a slump\"' => {
                  'page_results' => 1,
                  'total_results' => 1
              },
              'Αθήνα' => {
                  'page_results' => 20,
                  'total_results' => 121
              },
              'Lopadotemachoselachogaleokranioleipsanodrimhypotrimmatosilphioparaomelitokatakechymenokichlepikossyphophattoperisteralektryonoptekephalliokigklopeleiolagoiosiraiobaphetraganopterygon' => {
                  'page_results' => 0,
                  'total_results' => 0
              },
          },
          'BioMedCentral' => {
              'nature' => {
                  'page_results' => 20,
                  'total_results' => 67790
              },
              '\"rock and roll was in a slump\"' => {
                  'page_results' => 0,
                  'total_results' => 0
              },
              'Αθήνα' => {
                  'page_results' => 0,
                  'total_results' => 0
              },
              'Lopadotemachoselachogaleokranioleipsanodrimhypotrimmatosilphioparaomelitokatakechymenokichlepikossyphophattoperisteralektryonoptekephalliokigklopeleiolagoiosiraiobaphetraganopterygon' => {
                  'page_results' => 0,
                  'total_results' => 0
              },
          },
      }
  }

  page_results = @current_page.result_list.size
  total_results = @current_page.total_result_count

  expect(page_results).to eq(expected_results[ENV['env']][ENV['brand']][search_text]['page_results'])
  expect(total_results).to eq(expected_results[ENV['env']][ENV['brand']][search_text]['total_results'])

end

Then(/^I should see a message containing "([^"]*)" notifying me there are no results$/) do |message|
  expect(@current_page.no_results.text).to include(message)
end