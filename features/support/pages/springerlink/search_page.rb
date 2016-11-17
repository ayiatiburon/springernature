module SpringerLink
  class SearchPage
    include PageObject

    def get_url
      $global_pages[ENV['env']][ENV['brand']]['search_page']
    end

    def result_list
      @browser.elements(:xpath => "//ol[contains(@id,'results-list')]/li")
    end

    def total_result_count
      @browser.elements(:xpath => "//h1[contains(@class, 'number-of-search-results-and-search-terms')]/strong")[0].text.gsub(",", "_").to_i
    end

    def no_results
      @browser.div(:id => "no-results-message")
    end
  end
end