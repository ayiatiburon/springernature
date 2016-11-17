require 'watir-webdriver'
require 'rspec'
require 'awesome_print'
require 'pry'
require 'page-object'
require 'colorize'
require 'facets'

#due to a lack of knowledge of the rest of the Springer Nature sites, and possible pages, this is a minimalistic [and hardcoded] list of pages - I would rather get this list dynamically if possible
#understandably, this is overkill - but its just to demonstrate that URLs shouldn't need to be hardcoded, and can be kept in a central place for easier maintenance
$global_pages = {
    'prod' => {
        'SpringerLink' => {
            'home_page' => 'http://link.springer.com',
            'search_page' => 'http://link.springer.com/search'
        },
        'BioMedCentral' => {
            'home_page' => "http://www.biomedcentral.com",
            "search_page" => "http://www.biomedcentral.com/search",
        },
    }
}


if ENV['env'].nil?
  puts "You need to include the 'env' command line option. e.g:".red
  puts "cucumber -t @happy env=prod".red
  exit
end
if !$global_pages.keys.include? ENV['env']
  puts "'#{ENV['env']}' is not a valid option for 'env' - the valid options are: #{$global_pages.keys.inspect}".red
  exit
end

if ENV['brand'].nil?
  puts "You need to include the 'brand' command line option. e.g:".red
  puts "cucumber -t @happy brand=springer".red
  exit
end
if !$global_pages[ENV['env']].keys.include? ENV['brand']
  puts "'#{ENV['brand']}' is not a valid option for 'brand' - the valid options are: #{$global_pages[ENV['env']].keys.inspect}".red
  exit
end

browsers = ['chrome', 'firefox']
if ENV['browser'].nil?
  puts "You need to include the 'browser' command line option. e.g:".red
  puts "cucumber -t @happy browser=chrome".red
  exit
end
if !browsers.include? ENV['browser']
  puts "'#{ENV['browser']}' is not a valid option for 'env' - the valid options are: #{browsers.inspect}".red
  exit
end





