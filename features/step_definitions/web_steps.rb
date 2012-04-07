Given /^I am on the (.+)$/ do |page_name|
 
 # path_to è un helper di cucumber che ho definito in support/paths.rb
 # in paths.rb è presente un modulo NavigationHelpers che ho incluso
 # in cucumber tramite World() messo in paths.rb
 
 visit path_to(page_name) 
end

When /^I follow "([^"]*)"$/ do |link|
  click_link link
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field,with:value) 
end

When /^I press "([^"]*)"$/ do |button|
  click_button button
end

Then /^I should see "([^"]*)"$/ do |message|
  page.should have_content message
end

# Qui sotto si utilizza value.inspect. Questo metodo ritorna una versione stampabile della stringa
# In  pratica la stringa viene stampata con "" e con i caratteri speciali escaped. 

Then /^I should see "([^"]*)" within "([^"]*)"$/ do |value, selector|
  page.should have_css(selector,:text=>value), "Expected to see #{value.inspect} inside #{selector}, but did not."
end


Then /^I should not see "([^"]*)"$/ do |name|
   
   page.should_not have_content name
end


Then /^I should not see "([^"]*)" within "([^"]*)"$/ do |value,selector|
   
   page.should_not have_css(selector,:text=>value), "Expected NOT to see #{value.inspect} inside #{selector}, but did."

end


Then /^show me the page$/ do
 save_and_open_page
end

When /^I attach the file "([^"]*)" to "([^"]*)"$/ do |path,file_field|

  attach_file(file_field,path)

end
