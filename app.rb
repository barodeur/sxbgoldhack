require 'bundler/setup'

require 'capybara/dsl'
require 'capybara-webkit'
require 'pry'

include Capybara::DSL
Capybara.current_driver = :webkit
Capybara.app_host = 'https://docs.google.com/'
page.visit('/a/chobert.fr/spreadsheet/viewform?formkey=dHd6a0tsZlBoTG5Hd0k4TU4tVm5XVmc6MQ')

votes = [3, 2, 3, 4, 2, 1, 1, 5, 2, 4, 3]
votes.each_with_index do |vote, index|
  page.choose "group_#{index}_#{vote}"
end

begin
  page.click_button 'Envoyer'
rescue Capybara::ElementNotFound
  page.click_button 'Submit'
end
