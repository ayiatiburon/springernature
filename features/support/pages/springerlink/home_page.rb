module SpringerLink
  class HomePage
    include PageObject

    text_field(:search_field, :xpath => "//input[@id='query']")
    element(:search_button, :xpath => "//input[@id='search']")

    def get_url
      $global_pages[ENV['env']][ENV['brand']]['home_page']
    end
  end
end