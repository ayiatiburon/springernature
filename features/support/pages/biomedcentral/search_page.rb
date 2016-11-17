module BioMedCentral
  class SearchPage
    include PageObject



    def get_url
      $global_pages[ENV['env']][ENV['brand']]['search_page']
    end

    def result_list
      @browser.elements(:xpath => "//ol[contains(@class,'ResultsList')]/li[contains(@class,'ResultsList_item')]")
    end

    def total_result_count
      @browser.elements(:xpath => "//h2[contains(@class, 'Results_title')]/strong")[0].text.gsub(",", "_").to_i
    end

    def no_results
      @browser.element(:xpath => "//div[contains(@id,'search-container')]/h3")
    end
  end
end