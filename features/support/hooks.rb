

Before do
  @browser = Watir::Browser.new ENV['browser'].to_sym
end

After do
  @browser.close
end