Given /I am on the new feature page/ do
  visit "/features/new"
end

Given /^the following features:$/ do |features|
  Feature.create!(features.hashes)
end

Given /I am on the show feature (\d+)(?:st|nd|rd|th) page/ do |pos|
  visit features_url
  within("#feature_line_#{pos.to_i-1}") do
    click_link "Show"
  end
end

When /^I click 'Add Story'$/ do
  click_link 'Add Story'
end


When /^I delete the (\d+)(?:st|nd|rd|th) feature$/ do |pos|
  visit features_url
  within("#feature_line_#{pos.to_i-1}") do
    click_link "Destroy"
  end
end

Then /^I should see the following features:$/ do |features|
  features.raw[1..-1].each_with_index do |row, i|
    response.should have_xpath("//div[@id='feature_line_#{i}']")
  end
end

Then /^I should see new story form$/ do
  response.should have_xpath("//input[@name='story[tiitle]']") && have_xpath("//textarea[@name='story[description]']")
end

