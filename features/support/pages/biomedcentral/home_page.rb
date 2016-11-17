module BioMedCentral
  class HomePage
    include PageObject

    text_field(:search_field, :xpath => "//input[@id='publisherSearch']")
    button(:search_button, :id => "search")

    def get_url
      $global_pages[ENV['env']][ENV['brand']]['home_page']
    end
  end
end