Given /I am on the new story page/ do
  visit new_feature_story_path(Feature.first)
end

Given /^the following stories:$/ do |stories|
  stories_hash = stories.hashes
  stories_hash.each { |story| story[:feature_id] = Feature.first.id}
  Story.create!(stories_hash)
end

When /^I delete the (\d+)(?:st|nd|rd|th) story$/ do |pos|
  visit feature_stories_url(Feature.first)
  within("#story_line_#{pos.to_i-1}") do
    click_link "Destroy"
  end
end

Then /^I should see the following stories:$/ do |stories|
  stories.raw[1..-1].each_with_index do |row, i|
    response.should have_xpath("//div[@id='story_line_#{i}']")
  end
end
